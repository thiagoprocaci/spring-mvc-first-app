package com.tbp.repository;

import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class SkillRepository {

    public List<String> findAll() {
        List<String> stringList = Arrays.asList("Good Father", "Good Programmer", "Friendly");
        return stringList;
    }


}
