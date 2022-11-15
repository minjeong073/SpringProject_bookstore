package com.ming.project.bookstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
public class ProjectBookstoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectBookstoreApplication.class, args);
	}

}
