package rentify.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

import org.springframework.stereotype.Component;

import lombok.Data;

@Entity
@Data
@Component
public class Property {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String place;
	int numberofbedrooms;
	int numberofbathrooms;
	String nearbyhospital;
	String nearbycollege;
	double price;
	@Lob
	byte[] image;
	int bought;
	int sold;
	
	
}
