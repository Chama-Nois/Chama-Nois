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

import com.chamanois.model.Clientes;
import com.chamanois.services.ClientesService;

@Controller
@RequestMapping("/clientes")
public class ClientesController {

	@Autowired
	private ClientesService clientesService;

	@GetMapping
	public String listClientes(Model model) {
		List<Clientes> clientes = clientesService.getAllClientes();
		model.addAttribute("clientes", clientes);
		return "ListarClientes";
	}

	@GetMapping("/novo-cliente")
	public String showFormForAdd(Model model) {
		Clientes clientes = new Clientes();
		model.addAttribute("clientes", clientes);
		return "clientesForm";
	}

	@PostMapping("/salvar-cliente")
	public String saveCliente(@ModelAttribute("clientes") Clientes clientes) {
		clientesService.saveCliente(clientes);
		return "redirect:/clientes";
	}

	@GetMapping("/editar-cliente/{id}")
	public String showFormForUpdate(@PathVariable Long id, Model model) {
		Clientes clientes = clientesService.getClienteById(id);
		model.addAttribute("clientes", clientes);
		return "editarClientes";
	}

	@PostMapping("/editar-cliente/{id}")
	public String updateCliente(@PathVariable Long id, @ModelAttribute("clientes") Clientes clientes) {
		clientesService.updateCliente(id, clientes);
		return "redirect:/clientes";
	}

	@GetMapping("/deletar-cliente/{id}")
	public String deleteCliente(@PathVariable Long id) {
		clientesService.deleteCliente(id);
		return "redirect:/clientes";
	}
}
