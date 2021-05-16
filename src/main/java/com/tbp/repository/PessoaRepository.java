package com.tbp.repository;

import com.tbp.model.Pessoa;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;

@Component
public class PessoaRepository {

    private static List<Pessoa> pessoaList = new ArrayList<Pessoa>();

    public Pessoa salvar(String nome, Date dataNascimento, String cidade) {
        Integer id = pessoaList.size();
        Pessoa p = new Pessoa(id, nome, dataNascimento, cidade);
        pessoaList.add(p);
        return p;
    }

    public List<Pessoa> listar() {
        return pessoaList;
    }

    public Pessoa obterPorId(Integer id) {
        for (Pessoa p : pessoaList) {
            if (p != null && p.getId() != null && p.getId().equals(id)) {
                return p;
            }
        }
        return null;
    }
}
