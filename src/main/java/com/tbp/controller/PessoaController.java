package com.tbp.controller;

import com.tbp.exception.PessoaException;
import com.tbp.model.Pessoa;
import com.tbp.service.PessoaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("pessoa")
public class PessoaController {

    @Autowired
    private PessoaService pessoaService;

    @RequestMapping(value = "listar", method = RequestMethod.GET)
    public String listaPrioridade(Map<String, Object> model) {
        List<Pessoa> pessoaList = pessoaService.listaPrioridade();
        model.put("pessoaList", pessoaList);
        return "pessoa/listar";
    }

    @RequestMapping(value = "cadastrar", method = RequestMethod.GET)
    public String paginaCadastro() {
        return "pessoa/salvar";
    }

    @RequestMapping(value = "cadastrar", method = RequestMethod.POST)
    public String cadastrar(
            @RequestParam("nome") String nome,
            @RequestParam("cidadePessoa") String cidade,
            @RequestParam("dataNascimento") String dataNascimento,
            Map<String, Object> model) {
        try {
            pessoaService.salvar(nome, dataNascimento, cidade);
        } catch (PessoaException e) {
            model.put("mensagem", e.getMessage());
            return "pessoa/salvar";
        }
        return "redirect:/pessoa/listar";
    }

    @RequestMapping(value = "atualizar", method = RequestMethod.GET)
    public String paginaAtualizar(@RequestParam("id") Integer id, Map<String, Object> model) {
        Pessoa pessoa = pessoaService.obterPorId(id);
        model.put("pessoa", pessoa);
        return "pessoa/atualizar";
    }

    @RequestMapping(value = "atualizar", method = RequestMethod.POST)
    public String atualizar(@RequestParam("id") Integer id, @RequestParam("vacinado") String vacinado) {
        pessoaService.editar(id, vacinado);
        return "redirect:/pessoa/listar";
    }

}
