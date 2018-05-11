package com.niit.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="CATEGORY")
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	private int id;
	@NotBlank(message="Plz enter category")
	private String name;
	@OneToMany(mappedBy="category")
	private List<Product>products;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
