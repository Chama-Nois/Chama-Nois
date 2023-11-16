package com.chamanois.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class CadastroController {
	@GetMapping("/cadastro")
	public String index() {
		return "cadastro";
	}

}
