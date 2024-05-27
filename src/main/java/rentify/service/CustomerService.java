package rentify.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import rentify.dao.CustomerDao;
import rentify.dto.Customer;
import rentify.dto.Property;

@Component
public class CustomerService {

	@Autowired
	Property property;

	@Autowired
	Customer customer;

	@Autowired
	CustomerDao dao;

	public ModelAndView load() {
		ModelAndView andView = new ModelAndView("Signup.jsp");
		andView.addObject("customer", customer);

		return andView;
	}

	public ModelAndView signup(Customer customer, String date) {
		ModelAndView andView = new ModelAndView();

		Date dob = Date.valueOf(date);
		int age = Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
		if (age < 18) {
			andView.setViewName("Signup.jsp");
			andView.addObject("customer", customer);
			andView.addObject("msg", "You have to be 18+ to create Account");
		} else {
			if (dao.find(customer.getMobile()).isEmpty()) {
				customer.setAge(age);
				customer.setDob(dob);
				dao.save(customer);
				andView.setViewName("Home.jsp");
				andView.addObject("msg", "Account Created Successfully Your Customer Id is : " + customer.getId());
			} else {
				andView.setViewName("Signup.jsp");
				andView.addObject("customer", customer);
				andView.addObject("msg", "Mobile Number already Exists");
			}
		}
		return andView;
	}
	public ModelAndView login(int cid, String password, HttpSession session) {
		ModelAndView andView = new ModelAndView();
		Customer customer = dao.find(cid);
		if (customer == null) {
			andView.setViewName("Login.jsp");
			andView.addObject("msg", "Incorrect Customer Id");
		} else {
			if (customer.getPassword().equals(password)) {
				session.setAttribute("customer", customer);
				andView.setViewName("Home.jsp");
				andView.addObject("msg", "Login Success");
			} else {
				andView.setViewName("Login.jsp");
				andView.addObject("msg", "Incorrect Password");
			}
		}
		return andView;
	}

	public ModelAndView logout(HttpSession session) {
		ModelAndView andView = new ModelAndView("Home.jsp");
		if (session.getAttribute("customer") == null) {
			andView.addObject("msg", "Session Expired");
		} else {
			session.invalidate();
			andView.addObject("msg", "Logout Success");
		}
		return andView;
	}

	public ModelAndView addProduct(String pplace, double pprice, int NBEDR, int NBATHDR, String Nbycollege,
			String Nbyhospital, MultipartFile pimage, HttpSession session) throws IOException {
		Customer customer = (Customer) session.getAttribute("customer");

		property.setPlace(pplace);
		property.setPrice(pprice);
		property.setNumberofbathrooms(NBEDR);
		property.setNumberofbedrooms(NBATHDR);
		property.setNearbycollege(Nbycollege);
		property.setNearbyhospital(Nbyhospital);
		property.setSold(customer.getId());

		byte[] pic = null;
		if (pimage != null) {
			InputStream inputStream = pimage.getInputStream();
			pic = new byte[inputStream.available()];
			inputStream.read(pic);
		}
		property.setImage(pic);
		List<Property> list = customer.getProperties();
		if (list == null) {
			list = new ArrayList<Property>();
		}
		list.add(property);
		customer.setProperties(list);
		dao.update(customer);
		ModelAndView andView = new ModelAndView("Home.jsp");
		andView.addObject("msg", "Added Property for Sale");
		return andView;
	}
	

	public ModelAndView addMoney(double money, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("customer");
		customer.setWallet(customer.getWallet() + money);
		dao.update(customer);

		ModelAndView andView = new ModelAndView("Home.jsp");
		andView.addObject("msg", "Added Money in wallet");

		return andView;
	}

	public ModelAndView displayProducts(HttpSession session) {
		ModelAndView andView = new ModelAndView();
		Customer customer = (Customer) session.getAttribute("customer");
		List<Property> properties = dao.fetchProduct();
		List<Property> products1 = new ArrayList<>();
		for (Property property : properties) {
			if (property.getBought() == 0) {
				products1.add(property);
			}
		}
		if (customer != null) {
			List<Property> products2 = customer.getProperties();
			if (products2 != null)
				products1.removeAll(products2);
		}
		if (products1.isEmpty()) {
			andView.addObject("msg", "No Property You can Purchase");
			andView.setViewName("Home.jsp");
		} else {
			andView.addObject("list", products1);
			andView.setViewName("Buy.jsp");
		}
		return andView;
	}
	
	
	public ModelAndView buyProduct(HttpSession session, int id) {
		ModelAndView andView = new ModelAndView();
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer == null) {
			andView.setViewName("Login.jsp");
			andView.addObject("msg", "First Login Then only You can Buy");
		} else {
			Property property = dao.findProperty(id);

			if (customer.getWallet() < property.getPrice()) {
				andView.addObject("msg", "Insufficient Balance");
				andView.setViewName("Home.jsp");
			} else {
				customer.setWallet(customer.getWallet() - property.getPrice());
				Customer customer2 = dao.find(property.getSold());
				customer2.setWallet(customer2.getWallet() + property.getPrice());

				property.setBought(customer.getId());
				List<Property> properties = customer.getProperties();
				properties.add(property);

				dao.update(customer);
				dao.update(customer2);
				andView.setViewName("Home.jsp");

//				andView.addObject("msg", "details  Successfully sended to your mail  " + customer.getAddress());
				andView.addObject("msg", "details  Successfully sended to your mail  " + customer.getEmail());

			}
		}

		return andView;
	}

	// for finding email
	public Customer findEmail(int id) {
		return dao.find(id);
	}

}
