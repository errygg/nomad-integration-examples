package com.hashicorp.app;

import java.beans.BeanProperty;
import java.text.ParseException;
import java.util.Arrays;
import java.util.stream.Stream;

import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Bean
	ApplicationRunner init(ThingRepository repository) {

    String[][] data = {
			{"Joe", "1234"},
			{"Suzy", "5678"}
		};

		return args -> {
		  Stream.of(data).forEach(array -> {
  			Thing thing = new Thing(
	  			array[0],
					array[1]
				);
				repository.save(thing);
			});
			repository.findAll().forEach(System.out::println);
		};
	}
}