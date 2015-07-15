package com.absi.ims.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="ims_user")
public class IMSUser extends Auditable implements Serializable{

	private static final long serialVersionUID = -1206154523801426928L;

	@Id
	@Column(name="id")
	@SequenceGenerator(name = "IMSUserSequence", sequenceName = "IMS_USER_SEQUENCE", initialValue = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "IMSUserSequence")
	private Long id;
	
	@Column(name="first_name")
	private String firstname;
	
	@Column(name="middle_name")
	private String middlename;
	
	@Column(name="last_name")
	private String lastname;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
}
