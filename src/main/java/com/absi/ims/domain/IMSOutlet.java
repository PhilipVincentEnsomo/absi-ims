package com.absi.ims.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.constraints.Size;


@Entity
@Table(name="outlet")
public class IMSOutlet extends Auditable implements Serializable{

	private static final long serialVersionUID = 6874845063070243430L;
	
	@Id
	@Column(name = "id")
	@SequenceGenerator(name = "OutletSequence", sequenceName = "OUTLET_SEQUENCE", initialValue = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "OutletSequence")
	private Long id;
	
	@Size(min=1, max=500)
	@Column(name = "outlet_name")
	private String outletname;
	
	@Size(min=1, max=35)
	@Column(name = "contact_number")
	private String contactNumber;
	
	@Size(min=1, max=1000)
	@Column(name = "outlet_address")
	private String address;
	
	@Size(min=1, max=100)
	@Column(name = "city")
	private String city;
	
	@Size(min=1, max=35)
	@Column(name = "postal_code")
	private String postalCode;
	
	@Version
	private Long version;
	
	public Long getVersion() {
		return version;
	}
	
	public void setVersion(Long version) {
		this.version = version;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getOutletname() {
		return outletname;
	}
	
	public void setOutletname(String outletname) {
		this.outletname = outletname;
	}
	
	public String getContactNumber() {
		return contactNumber;
	}
	
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getPostalCode() {
		return postalCode;
	}
	
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	
}
