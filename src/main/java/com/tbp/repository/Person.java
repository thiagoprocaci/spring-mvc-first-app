package com.tbp.repository;

import java.util.List;

public class Person {

    String name;
    Integer age;
    String city;
    List<String> skills;

    public Person(String name, Integer age, String city, List<String> skills) {
        this.name = name;
        this.age = age;
        this.city = city;
        this.skills = skills;
    }

    public Person() {

    }

    public List<String> getSkills() {
        return skills;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

}
