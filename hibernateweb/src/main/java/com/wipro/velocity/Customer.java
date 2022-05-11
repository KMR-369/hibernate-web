package com.wipro.velocity;

import javax.persistence.*;

//persistent class for 1-1 mapping bidirectional

@Entity
@Table(name="customer")
public class Customer 
{
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @PrimaryKeyJoinColumn
    private int custId;
    private String name,email;
    
    @OneToOne(targetEntity=Address.class,cascade=CascadeType.ALL)
    Address address;

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
    
}
