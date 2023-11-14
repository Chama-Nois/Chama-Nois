package com.chamanois.services;

import java.util.List;

import com.chamanois.model.Clientes;

public interface ClientesService {
	List<Clientes> getAllClientes();

	Clientes getClienteById(Long idCliente);

	Clientes saveCliente(Clientes cliente);

	Clientes updateCliente(Long idCliente, Clientes clienteAtualizado);

	void deleteCliente(Long idCliente);
}
