package com.tbp.controller;

import com.tbp.repository.Person;
import com.tbp.repository.PersonRepository;
import com.tbp.repository.SkillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("person")
public class PersonController {

    @Autowired
    PersonRepository personRepository;
    @Autowired
    SkillRepository skillRepository;

    @RequestMapping(value = "list", method = RequestMethod.GET )
    public String listPage(Map<String, Object> model) {
        List<Person> personList = personRepository.findAll();
        model.put("personList", personList);
        return "/person/list";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET )
    public String editPage(Map<String, Object> model, @RequestParam("name") String name) {
        Person person = personRepository.getByName(name);
        model.put("person", person);
        List<String> all = skillRepository.findAll();
        model.put("skills", all);
        return "/person/edit";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST )
    public String update(@RequestParam("name") String name,
                        @RequestParam("age") Integer age,
                       @RequestParam("city") String city,
                         @RequestParam("skillList") List<String> skillList) {

        Person person = personRepository.getByName(name);
        person.setAge(age);
        person.setCity(city);
        person.setSkills(skillList);
        personRepository.save(person);
        return "redirect:/person/list";
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST )
    public String delete(@RequestParam("name") String name){
        personRepository.delete(name);
        return "redirect:/person/list";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET )
    public String createPage(Map<String, Object> model) {
        List<String> all = skillRepository.findAll();
        model.put("skills", all);
        return "/person/create";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST )
    public String create(@RequestParam("name") String name,
                         @RequestParam("age") Integer age,
                         @RequestParam("city") String city,
                         @RequestParam("skillList") List<String> skillList) {
        Person person = new Person(name, age, city, skillList);
        personRepository.save(person);
        return "redirect:/person/list";
    }
}
