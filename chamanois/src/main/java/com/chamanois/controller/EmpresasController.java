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

import com.chamanois.model.Empresas;
import com.chamanois.services.EmpresasService;

@Controller
@RequestMapping("/empresas")
public class EmpresasController {

	@Autowired
	private EmpresasService empresasService;

	@GetMapping
	public String listEmpresas(Model model) {
		List<Empresas> empresas = empresasService.getAllEmpresas();
		model.addAttribute("empresas", empresas);
		return "ListarEmpresas";
	}

	@GetMapping("/nova-empresa")
	public String showFormForAdd(Model model) {
		Empresas empresas = new Empresas();
		model.addAttribute("empresas", empresas);
		return "empresasForm";
	}

	@PostMapping("/salvar-empresa")
	public String saveEmpresa(@ModelAttribute("empresas") Empresas empresas) {
		empresasService.saveEmpresa(empresas);
		return "redirect:/empresas";
	}

	@GetMapping("/editar-empresa/{id}")
	public String showFormForUpdate(@PathVariable Long id, Model model) {
		Empresas empresas = empresasService.getEmpresaById(id);
		model.addAttribute("empresas", empresas);
		return "editarEmpresa";
	}

	@PostMapping("/editar-empresa/{id}")
	public String updateEmpresa(@PathVariable Long id, @ModelAttribute("empresas") Empresas empresas) {
		empresasService.updateEmpresa(id, empresas);
		return "redirect:/empresas";
	}

	@GetMapping("/deletar-empresa/{id}")
	public String deleteEmpresa(@PathVariable Long id) {
		empresasService.deleteEmpresa(id);
		return "redirect:/empresas";
	}
}
