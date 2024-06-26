package rentify.dao;

import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import rentify.dto.Customer;
import rentify.dto.Property;
@Component
public class CustomerDao {

	@Autowired
	EntityManager manager;

	public List<Customer> find(long mobile) {
		return manager.createQuery("select x from Customer x where mobile=?1").setParameter(1, mobile).getResultList();
	}

	public void save(Customer customer) {
		manager.getTransaction().begin();
		manager.persist(customer);
		manager.getTransaction().commit();
	}
	public Customer find(int cid) {
		return manager.find(Customer.class, cid);
	}

	public void update(Customer customer) {
		manager.getTransaction().begin();
		manager.merge(customer);
		manager.getTransaction().commit();
	}

	public List<Property> fetchProduct() {
		return manager.createQuery("select x from Property x").getResultList();
	}

	public Property findProperty(int pid) {
		return manager.find(Property.class, pid);
	}

}
