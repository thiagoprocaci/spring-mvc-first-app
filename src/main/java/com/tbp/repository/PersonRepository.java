package com.tbp.repository;

import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class PersonRepository {

    static Map<String, Person> personMap;

    static {
        Person john = new Person("John", 20, "Rio de Janeiro", new ArrayList<>(), "john@email.com", "123");
        Person mary = new Person("Mary", 22, "New York", new ArrayList<>(), "mary@email.com", "123");
        Person andrew = new Person("Andrew", 30, "London", new ArrayList<>(), "andrew@email.com", "123");

        personMap = new HashMap<String, Person>();
        personMap.put(john.getName(), john);
        personMap.put(mary.getName(), mary);
        personMap.put(andrew.getName(), andrew);
    }

    public List<Person> findAll() {
        List<Person> personList = new ArrayList<Person>();
        personList.addAll(personMap.values());
        return personList;
    }

    public void save(Person person) {
        personMap.put(person.getName(), person);
    }

    public void delete(String name) {
        personMap.remove(name);
    }

    public Person getByName(String name) {
        return personMap.get(name);
    }


    public List<Person> findBySkill(String skill) {
        List<Person> personList = new ArrayList<>();
        Collection<Person> all = personMap.values();
        for(Person p : all) {
            for(String s : p.getSkills()) {
                if(s.equals(skill)) {
                    personList.add(p);
                }
            }
        }
        return personList;
    }

}
