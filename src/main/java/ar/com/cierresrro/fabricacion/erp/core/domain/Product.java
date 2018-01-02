package ar.com.cierresrro.fabricacion.erp.core.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity(name="products")
@Table(name="products")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_id")
	private int productID;
	
	@Column(name="product_name")
	private String productName;
	
	@Column(name="cost")
	private int cost;
 
	public int getProductID() {
		return productID;
	}
 
	public void setProductID(int productID) {
		this.productID = productID;
	}
 
	public String getProductName() {
		return productName;
	}
 
	public void setProductName(String productName) {
		this.productName = productName;
	}
 
	public int getCost() {
		return cost;
	}
 
	public void setCost(int cost) {
		this.cost = cost;
	}
 
	@Override
	public String toString() {
		return "Product [productID=" + productID + ", productName=" + productName + ", cost=" + cost + "]";
	}
}