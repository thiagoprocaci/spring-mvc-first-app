package com.tbp.model;

import java.util.Date;
import java.util.Calendar;

public class Pessoa  {

    Integer id;
    String nome;
    Date dataNascimento;
    String cidade;
    Integer idade;
    boolean vacinado;

    public Pessoa(Integer id, String nome, Date dataNascimento, String cidade) {
        this.nome = nome;
        this.dataNascimento = dataNascimento;
        this.cidade = cidade;
        this.id = id;

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dataNascimento);
        int anoNascimento = calendar.get(Calendar.YEAR);

        Calendar hoje = Calendar.getInstance();
        int anoHoje = hoje.get(Calendar.YEAR);
        this.idade = anoHoje - anoNascimento;
        this.vacinado = false;
    }

    public void setVacinado(boolean vacinado) {
        this.vacinado = vacinado;
    }

    public Integer getId() {
        return id;
    }

    public boolean isVacinado() {
        return vacinado;
    }



    public String getNome() {
        return nome;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public String getCidade() {
        return cidade;
    }

    public Integer getIdade() {
        return idade;
    }
}
