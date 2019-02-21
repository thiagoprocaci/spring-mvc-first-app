package com.tbp.controller;

import com.tbp.repository.Person;
import com.tbp.repository.PersonRepository;
import com.tbp.repository.SkillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("rest")
public class PersonRest {

    @Autowired
    PersonRepository personRepository;
    @Autowired
    SkillRepository skillRepository;

    @RequestMapping(value = "personList", method = RequestMethod.GET)
    public List<Person> findAllPerson() {
        return personRepository.findAll();
    }

    @RequestMapping(value = "skillList", method = RequestMethod.GET)
    public List<String> findAllSkill() {
        return skillRepository.findAll();
    }

    @RequestMapping(value = "personByName", method = RequestMethod.GET)
    public Person findPersonByName(@RequestParam("name") String name) {
        return personRepository.getByName(name);
    }

    @RequestMapping(value = "personBySkill", method = RequestMethod.GET)
    public List<Person> findPersonBySkill(@RequestParam("skill") String skill) {
        return personRepository.findBySkill(skill);
    }






}
