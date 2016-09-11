/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dominio;

/**
 *
 * @author Sakamoto
 */
public class Curso {
    
    private String nome;
    private String sigla;
    private String regime;
    private int duracao;
    private String descricao;
    private int grauInstrucao;
    private int areaConhecimento;

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the sigla
     */
    public String getSigla() {
        return sigla;
    }

    /**
     * @param sigla the sigla to set
     */
    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    /**
     * @return the regime
     */
    public String getRegime() {
        return regime;
    }

    /**
     * @param regime the regime to set
     */
    public void setRegime(String regime) {
        this.regime = regime;
    }

    /**
     * @return the duracao
     */
    public int getDuracao() {
        return duracao;
    }

    /**
     * @param duracao the duracao to set
     */
    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the grauInstrucao
     */
    public int getGrauInstrucao() {
        return grauInstrucao;
    }

    /**
     * @param grauInstrucao the grauInstrucao to set
     */
    public void setGrauInstrucao(int grauInstrucao) {
        this.grauInstrucao = grauInstrucao;
    }

    /**
     * @return the areaConhecimento
     */
    public int getAreaConhecimento() {
        return areaConhecimento;
    }

    /**
     * @param areaConhecimento the areaConhecimento to set
     */
    public void setAreaConhecimento(int areaConhecimento) {
        this.areaConhecimento = areaConhecimento;
    }
    
    
    
}
