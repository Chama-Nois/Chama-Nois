package com.chamanois.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.chamanois.model.Clientes;
import com.chamanois.repositories.ClientesRepository;
import com.chamanois.services.ClientesService;

public class ClientesServiceImpl implements ClientesService {

	@Autowired
	private ClientesRepository clientesRepository;

	@Override
	public List<Clientes> getAllClientes() {
		return clientesRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Clientes getClienteById(Long idCliente) {
		return clientesRepository.findById(idCliente).orElse(null);
	}

	@Override
	@Transactional
	public Clientes saveCliente(Clientes cliente) {
		return clientesRepository.save(cliente);
	}

	@Override
	public Clientes updateCliente(Long idCliente, Clientes clienteAtualizado) {
		Clientes clienteExistente = clientesRepository.findById(idCliente).orElse(null);
		if (clienteExistente != null) {
			clienteExistente.setNomeCliente(clienteAtualizado.getNomeCliente());
			clienteExistente.setCpfCliente(clienteAtualizado.getCpfCliente());
			clienteExistente.setEnderecoCliente(clienteAtualizado.getEnderecoCliente());
			clienteExistente.setTelefoneCliente(clienteAtualizado.getTelefoneCliente());
			return clientesRepository.save(clienteExistente);
		} else {
			throw new RuntimeException("Cliente com o ID" + idCliente + "não foi encontrado.");
		}
	}

	@Override
	public void deleteCliente(Long idCliente) {
		clientesRepository.deleteById(idCliente);

	}

}
