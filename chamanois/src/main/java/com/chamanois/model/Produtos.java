package com.chamanois.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Produtos {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idProduto;
	private String nomeProduto;
	private double valorProduto;
	private String descricaoProduto;
	private int avaliacaoProduto;
	private String imgUrl;

	@ManyToOne
	@JoinColumn(name = "idEmpresa")
	private Empresas empresas;

	public Produtos() {

	}

	public Produtos(Long idProduto, String nomeProduto, double valorProduto, String descricaoProduto,
			int avaliacaoProduto, String imgUrl, Empresas empresas) {
		this.idProduto = idProduto;
		this.nomeProduto = nomeProduto;
		this.valorProduto = valorProduto;
		this.descricaoProduto = descricaoProduto;
		this.avaliacaoProduto = avaliacaoProduto;
		this.imgUrl = imgUrl;
		this.empresas = empresas;
	}

	public Long getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Long idProduto) {
		this.idProduto = idProduto;
	}

	public String getNomeProduto() {
		return nomeProduto;
	}

	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}

	public double getValorProduto() {
		return valorProduto;
	}

	public void setValorProduto(double valorProduto) {
		this.valorProduto = valorProduto;
	}

	public String getDescricaoProduto() {
		return descricaoProduto;
	}

	public void setDescricaoProduto(String descricaoProduto) {
		this.descricaoProduto = descricaoProduto;
	}

	public int getAvaliacaoProduto() {
		return avaliacaoProduto;
	}

	public void setAvaliacaoProduto(int avaliacaoProduto) {
		this.avaliacaoProduto = avaliacaoProduto;
	}

	public Empresas getEmpresas() {
		return empresas;
	}

	public void setEmpresas(Empresas empresas) {
		this.empresas = empresas;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
