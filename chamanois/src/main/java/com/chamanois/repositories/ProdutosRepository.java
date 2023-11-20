package com.chamanois.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.chamanois.model.Produtos;

@Repository
public interface ProdutosRepository extends JpaRepository<Produtos, Long>{

}
