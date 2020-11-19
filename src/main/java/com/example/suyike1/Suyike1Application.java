package com.example.suyike1;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan("com.suyike.mapper")
@ComponentScan("com.suyike")
public class Suyike1Application {

    public static void main(String[] args) {
        SpringApplication.run(Suyike1Application.class, args);
    }

}
