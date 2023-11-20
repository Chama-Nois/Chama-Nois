package com.chamanois.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.chamanois.model.Empresas;

@Repository
public interface EmpresasRepository extends JpaRepository<Empresas, Long> {

}
