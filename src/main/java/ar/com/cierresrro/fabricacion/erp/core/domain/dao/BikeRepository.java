package ar.com.cierresrro.fabricacion.erp.core.domain.dao;


import java.io.Serializable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ar.com.cierresrro.fabricacion.erp.core.domain.Bike;

@Repository 
public interface BikeRepository extends CrudRepository<Bike, Serializable> {

 
}