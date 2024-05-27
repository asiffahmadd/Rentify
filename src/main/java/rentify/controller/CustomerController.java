package rentify.controller;



import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import rentify.dto.Customer;
import rentify.service.CustomerService;



@Controller
public class CustomerController {

	
	@Autowired
	CustomerService service;

	
	@Autowired
	JavaMailSender javaMailSender;
	
	
	@RequestMapping("load")
	public ModelAndView load() {
		return service.load();
	}
	
	
	@PostMapping("signup")
	public ModelAndView signup(@ModelAttribute Customer customer, @RequestParam String bdate) {
		return service.signup(customer, bdate);
	}
	
	@PostMapping("login")
	public ModelAndView login(@RequestParam int cid, @RequestParam String password, HttpSession session) {
		return service.login(cid, password, session);
	}

	
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		return service.logout(session);
	}
	

	@PostMapping("addproduct")
	public ModelAndView addProduct(@RequestParam String pplace, @RequestParam double pprice, @RequestParam int NBEDR,
			@RequestParam int NBATHDR, @RequestParam String Nbycollege, @RequestParam String Nbyhospital,
			@RequestParam MultipartFile pimage, HttpSession session) throws IOException {
		return service.addProduct(pplace, pprice, NBEDR, NBATHDR, Nbycollege, Nbyhospital, pimage, session);
	}
	
	@RequestMapping("addmoney")
	public ModelAndView addMoney(@RequestParam double money, HttpSession session) {
		return service.addMoney(money, session);
	}

	
	@RequestMapping("displayproducts")
	public ModelAndView displayProducts(HttpSession session) {
		return service.displayProducts(session);
	}

	@RequestMapping("buy")
	public ModelAndView buyProducts(@RequestParam int id, HttpSession session ) throws UnsupportedEncodingException, MessagingException {
//		Customer c	= service.findEmail(id);
//		sellerMassage(c) ;
//		buyerMassage(c) ;
		return service.buyProduct(session, id);
	}
	

	
	public boolean sellerMassage(Customer c) throws UnsupportedEncodingException, MessagingException {
		MimeMessage Mimmessage = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(Mimmessage);

		helper.setFrom("asifahmad201706@gmail.com", "customer authentication");
		helper.setTo(c.getEmail());
		helper.setSubject("<h1>some is intrested in your property </h1>");
		helper.setText("hello");
		javaMailSender.send(Mimmessage);
		return true;
	}
	
	
	
	public boolean buyerMassage(Customer c) throws UnsupportedEncodingException, MessagingException {
		MimeMessage Mimmessage = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(Mimmessage);

		helper.setFrom("asifahmad201706@gmail.com", "customer authentication");
		helper.setTo(c.getEmail());
		helper.setSubject("<h1>this is the property details</h1>");
		helper.setText("hello");
		javaMailSender.send(Mimmessage);
		return true;
	}

}
