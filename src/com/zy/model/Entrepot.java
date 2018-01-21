package com.zy.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 仓库
 * @author lenovo
 *
 */
@Entity
@Table
public class Entrepot implements java.io.Serializable{
	
	private int id;//仓库id
	private String entrepotName;//仓库名称
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEntrepotName() {
		return entrepotName;
	}
	public void setEntrepotName(String entrepotName) {
		this.entrepotName = entrepotName;
	}

}
