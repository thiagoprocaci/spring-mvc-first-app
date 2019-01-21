package com.tbp.controller;

import com.tbp.repository.Person;
import com.tbp.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("person")
public class PersonController {

    @Autowired
    PersonRepository personRepository;

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
        return "/person/edit";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST )
    public String update(@RequestParam("name") String name,
                        @RequestParam("age") Integer age,
                       @RequestParam("city") String city) {

        Person person = personRepository.getByName(name);
        person.setAge(age);
        person.setCity(city);
        personRepository.save(person);
        return "redirect:/person/list";
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST )
    public String update(@RequestParam("name") String name){
        personRepository.delete(name);
        return "redirect:/person/list";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET )
    public String createPage() {
        return "/person/create";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST )
    public String create(@RequestParam("name") String name,
                         @RequestParam("age") Integer age,
                         @RequestParam("city") String city) {
        Person person = new Person(name, age, city);
        personRepository.save(person);
        return "redirect:/person/list";
    }
}
