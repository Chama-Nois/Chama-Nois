package com.chamanois.services;

import java.util.List;

import com.chamanois.model.Empresas;

public interface EmpresasService {
	List<Empresas> getAllEmpresas();

	Empresas getEmpresaById(Long idEmpresa);

	Empresas saveEmpresa(Empresas empresa);

	Empresas updateEmpresa(Long idEmpresa, Empresas empresaAtualizada);

	void deleteEmpresa(Long idEmpresa);
}
