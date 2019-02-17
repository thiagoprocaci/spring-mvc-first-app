# Aplicação Spring MVC

## Classes


### Application

```
package com.tbp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.CharacterEncodingFilter;


@SpringBootApplication
public class Application  {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }


    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setForceEncoding(true);
        characterEncodingFilter.setEncoding("UTF-8");
        registrationBean.setFilter(characterEncodingFilter);
        return registrationBean;
    }


}

```

### Person

```
package com.tbp.repository;

public class Person {

    String name;
    Integer age;
    String city;

    public Person(String name, Integer age, String city) {
        this.name = name;
        this.age = age;
        this.city = city;
    }

    public Person() {

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

```
### PersonRepository

```
package com.tbp.repository;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class PersonRepository {

    static Map<String, Person> personMap;

    static {
        Person john = new Person("John", 20, "Rio de Janeiro");
        Person mary = new Person("Mary", 22, "New York");
        Person andrew = new Person("Andrew", 30, "London");

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

}


```


### WelcomeController

```
package com.tbp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {

    @RequestMapping(value = "/",  method = RequestMethod.GET)
    public String index() {
        return "index";
    }

}

```

### PersonController

```
package com.tbp.controller;

import com.tbp.repository.Person;
import com.tbp.repository.PersonRepository;
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


```

### HelloController

```
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
```

## Arquivo de Configuração

### application.properties

```
server.context-path = /spring-mvc

spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp

```

## JSP

### index.jsp

```
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
   <head>
   	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   </head>
    <body>

      <a href="<%=request.getContextPath()%>/person/list">Person CRUD</a>


      <br>
    </body>
</html>

```

### list.jsp

```
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<center>
    <h1>
        Person List
    </h1>


    <table>
     <tr>
        <th>
            Edit
        </th>
        <th>
            Name
        </th>
        <th>
            Age
        </th>
        <th>
            City
        </th>
      </tr>
      <c:forEach var="person" items="${personList}">
       <tr>
            <td>
                <a href="<%=request.getContextPath()%>/person/edit?name=${person.name}">Edit</a>
            </td>
            <td>
                <c:out value="${person.name}" />
            </td>
            <td>
                <c:out value="${person.age}" />
            </td>
            <td>
                <c:out value="${person.city}" />
            </td>
        </tr>
      </c:forEach>
     </table>


      <a href="<%=request.getContextPath()%>/person/create">Add Person</a>
</center>
</body>
</html>

```

### edit.jsp

```
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
 <center>
    <h1>
        Person Edit
    </h1>

    <form method="post" action="<%=request.getContextPath()%>/person/update">
        Name:
        <c:out value="${person.name}" />
        <input type="hidden" name="name" value="${person.name}" >
        <br><br>
        Age:
        <input type="number" name="age" value="${person.age}" >
        <br><br>
        City:
        <input type="text" name="city" value="${person.city}" >
        <br><br>
        <input type="submit" value="Save" />
    </form>

    <br><br>

    <form method="post" action="<%=request.getContextPath()%>/person/delete">
      <input type="hidden" name="name" value="${person.name}" >
      <input type="submit" value="Delete" />
    </form>

</center>
</body>
</html>

```

### create.jsp

```
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<center>
    <h1>
        Person Create
    </h1>

    <form method="post" action="<%=request.getContextPath()%>/person/create">
        Name:

        <input type="text" name="name"  >
        <br><br>
        Age:
        <input type="number" name="age" >
        <br><br>
        City:
        <input type="text" name="city"  >
        <br><br>

        <input type="submit" value="Save" />
    </form>

</center>
</body>
</html>

```
