package com.chamanois.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.chamanois.model.Clientes;

@Repository
public interface ClientesRepository extends JpaRepository<Clientes, Long> {

}
