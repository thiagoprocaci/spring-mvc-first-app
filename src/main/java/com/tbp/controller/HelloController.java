package com.tbp.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("hello")
public class HelloController {

    @RequestMapping(value = "sayHello", method = RequestMethod.GET)
    public String sayHello() {
        return "Hello!";
    }

    @RequestMapping(value = "sayHelloToSomeone", method = RequestMethod.GET)
    public String sayHello(@RequestParam("user") String user) {
        return "Hello " + user + "!!";
    }

}
