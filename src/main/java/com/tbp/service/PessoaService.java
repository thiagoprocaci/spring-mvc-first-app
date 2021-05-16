package com.tbp.service;

import com.tbp.exception.PessoaException;
import com.tbp.model.Pessoa;
import com.tbp.repository.PessoaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;


@Service
public class PessoaService {

    @Autowired
    private PessoaRepository pessoaRepository;


    public Pessoa editar(Integer id, String vacinado) {
        Pessoa pessoa = pessoaRepository.obterPorId(id);
        if(vacinado != null && vacinado.equals("S")) {
            pessoa.setVacinado(true);
        } else {
            pessoa.setVacinado(false);
        }
        return pessoa;
    }

    public Pessoa salvar(String nome, String dataNascimento, String cidade) throws PessoaException {
        // eh uma forma para transformar string em data
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date dataNasc = null;
        try {
            dataNasc = simpleDateFormat.parse(dataNascimento);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(nome == null || dataNasc == null || cidade == null || nome.trim().length() == 0 || cidade.trim().length() == 0) {
            throw new PessoaException("O nome, data de nascimento e cidade sao obrigatorios");
        }
        return pessoaRepository.salvar(nome, dataNasc, cidade);
    }


}
