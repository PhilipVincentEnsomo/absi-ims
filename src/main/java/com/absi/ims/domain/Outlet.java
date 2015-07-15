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
@Table(name="outlet")
public class Outlet extends Auditable implements Serializable{

	private static final long serialVersionUID = 6874845063070243430L;
	
	@Id
	@Column(name = "id")
	@SequenceGenerator(name = "OutletSequence", sequenceName = "OUTLET_SEQUENCE", initialValue = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "OutletSequence")
	private Long id;
	
	private String name;
	
	private Integer contactNumber;
	
}
