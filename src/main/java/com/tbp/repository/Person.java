package com.tbp.repository;

import java.util.ArrayList;
import java.util.List;

public class Person {

    String name;
    Integer age;
    String city;
    List<String> skills;
    String email;
    String password;

    public Person(String name, Integer age, String city, List<String> skills, String email, String password) {
        this.name = name;
        this.age = age;
        this.city = city;
        if(skills != null) {
            this.skills = skills;
        } else {
            this.skills = new ArrayList<>();
        }
        this.email = email;
        this.password = password;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
