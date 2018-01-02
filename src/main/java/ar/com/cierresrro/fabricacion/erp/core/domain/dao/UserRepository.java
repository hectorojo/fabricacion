package ar.com.cierresrro.fabricacion.erp.core.domain.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ar.com.cierresrro.fabricacion.erp.core.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
}