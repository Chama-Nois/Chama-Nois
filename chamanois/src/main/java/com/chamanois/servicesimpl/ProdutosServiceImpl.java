package com.chamanois.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chamanois.model.Produtos;
import com.chamanois.repositories.ProdutosRepository;
import com.chamanois.services.ProdutosService;

@Service
public class ProdutosServiceImpl implements ProdutosService {

	@Autowired
	private ProdutosRepository produtosRepository;

	@Override
	public List<Produtos> getAllProdutos() {
		return produtosRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Produtos getProdutoById(Long idProduto) {
		return produtosRepository.findById(idProduto).orElse(null);
	}

	@Override
	@Transactional
	public Produtos saveProduto(Produtos produto) {
		return produtosRepository.save(produto);
	}

	@Override
	public Produtos updateProduto(Long idProduto, Produtos produtoAtualizado) {
		Produtos produtoExistente = produtosRepository.findById(idProduto).orElse(null);
		if (produtoExistente != null) {
			produtoExistente.setNomeProduto(produtoAtualizado.getNomeProduto());
			produtoExistente.setValorProduto(produtoAtualizado.getValorProduto());
			produtoExistente.setDescricaoProduto(produtoAtualizado.getDescricaoProduto());
			produtoExistente.setAvaliacaoProduto(produtoAtualizado.getAvaliacaoProduto());
			produtoExistente.setImgUrl(produtoAtualizado.getImgUrl());
			return produtosRepository.save(produtoExistente);
		} else {
			throw new RuntimeException("Produto com o ID" + idProduto + "não foi encontrado.");
		}
	}

	@Override
	public void deleteProduto(Long idProduto) {
		produtosRepository.deleteById(idProduto);

	}

}
