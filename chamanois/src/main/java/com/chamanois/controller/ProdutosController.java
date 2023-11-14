package com.chamanois.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chamanois.model.Produtos;
import com.chamanois.services.ProdutosService;

@Controller
@RequestMapping("/produtos")
public class ProdutosController {

	@Autowired
	private ProdutosService produtosService;

	@GetMapping
	public String listProdutos(Model model) {
		List<Produtos> produtos = produtosService.getAllProdutos();
		model.addAttribute("produtos", produtos);
		return "ListarProdutos";
	}

	@GetMapping("/novo-produto")
	public String showFormForAdd(Model model) {
		Produtos produtos = new Produtos();
		model.addAttribute("produtos", produtos);
		return "produtosForm";
	}

	@PostMapping("/salvar-produto")
	public String saveProduto(@ModelAttribute("produtos") Produtos produtos) {
		produtosService.saveProduto(produtos);
		return "redirect:/produtos";
	}

	@GetMapping("/editar-produto/{id}")
	public String showFormForUpdate(@PathVariable Long id, Model model) {
		Produtos produtos = produtosService.getProdutoById(id);
		model.addAttribute("produtos", produtos);
		return "editarProdutos";
	}

	@PostMapping("/editar-produto/{id}")
	public String updateProduto(@PathVariable Long id, @ModelAttribute("produtos") Produtos produtos) {
		produtosService.updateProduto(id, produtos);
		return "redirect:/produtos";
	}

	@GetMapping("/deletar-produto/{id}")
	public String deleteProduto(@PathVariable Long id) {
		produtosService.deleteProduto(id);
		return "redirect:/produtos";
	}
}
