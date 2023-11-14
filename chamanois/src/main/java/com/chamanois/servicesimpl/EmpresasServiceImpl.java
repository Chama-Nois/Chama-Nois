package com.chamanois.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chamanois.model.Empresas;
import com.chamanois.repositories.EmpresasRepository;
import com.chamanois.services.EmpresasService;

@Service
public class EmpresasServiceImpl implements EmpresasService {

	@Autowired
	private EmpresasRepository empresasRepository;

	@Override
	public List<Empresas> getAllEmpresas() {
		return empresasRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Empresas getEmpresaById(Long idEmpresa) {
		return empresasRepository.findById(idEmpresa).orElse(null);
	}

	@Override
	@Transactional
	public Empresas saveEmpresa(Empresas empresa) {
		return empresasRepository.save(empresa);
	}

	@Override
	public Empresas updateEmpresa(Long idEmpresa, Empresas empresaAtualizada) {
		Empresas empresaExistente = empresasRepository.findById(idEmpresa).orElse(null);
		if (empresaExistente != null) {
			empresaExistente.setNomeEmpresa(empresaAtualizada.getNomeEmpresa());
			empresaExistente.setCnpjEmpresa(empresaAtualizada.getCnpjEmpresa());
			empresaExistente.setEnderecoEmpresa(empresaAtualizada.getEnderecoEmpresa());
			empresaExistente.setTelefoneEmpresa(empresaAtualizada.getTelefoneEmpresa());
			return empresasRepository.save(empresaExistente);
		} else {
			throw new RuntimeException("Empresa com o ID" + idEmpresa + "não foi encontrada.");
		}
	}

	@Override
	public void deleteEmpresa(Long idEmpresa) {
		empresasRepository.deleteById(idEmpresa);

	}

}
