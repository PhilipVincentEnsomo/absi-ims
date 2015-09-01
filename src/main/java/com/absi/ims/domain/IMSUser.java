package com.absi.ims.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.constraints.Size;

@Entity
@Table(name = "ims_user")
public class IMSUser extends Auditable implements Serializable {

	private static final long serialVersionUID = -1206154523801426928L;

	@Id
	@Column(name = "id")
	@SequenceGenerator(name = "IMSUserSequence", sequenceName = "IMS_USER_SEQUENCE", initialValue = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "IMSUserSequence")
	private Long id;

	@Size(min=1, max=35)
	@Column(name = "first_name")
	private String firstname;

	@Size(min=1, max=35)
	@Column(name = "middle_name")
	private String middlename;

	@Size(min=1, max=35)
	@Column(name = "last_name")
	private String lastname;

	@Enumerated(EnumType.STRING)
	@Column(name = "gender")
	private Gender gender;
	
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
	
	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

}
