package com.chamanois.services;

import java.util.List;

import com.chamanois.model.Produtos;

public interface ProdutosService {
	List<Produtos> getAllProdutos();

	Produtos getProdutoById(Long idProduto);

	Produtos saveProduto(Produtos produto);

	Produtos updateProduto(Long idProduto, Produtos produtoAtualizado);

	void deleteProduto(Long idProduto);

}
