package com.tbp.repository;

import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class SkillRepository {

    public List<String> findAll() {
        return Arrays.asList("Good Father", "Good Programmer", "Friendly");
    }


}
