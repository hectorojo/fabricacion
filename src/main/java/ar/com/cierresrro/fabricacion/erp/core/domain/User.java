package ar.com.cierresrro.fabricacion.erp.core.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "user")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
 
    @Column(name = "first_name")
    private String firstName;
 
    @Column(name = "last_name")
    private String lastName;
 
    @Column(name = "username")
    private String username;
 
    @Column(name = "created")
    @CreationTimestamp
    private Date created;
 
    @Column(name = "updated")
    @UpdateTimestamp
    private Date updated;
    
    @Column(name = "email")
    private String email;

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public Object getEmail() {
		// TODO Auto-generated method stub
		return null;
	}
 
    
 
}