package com.skilldistillery.hohohomies;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class HoHoHomiesApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(
			SpringApplicationBuilder application) {
		return application.sources(HoHoHomiesApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(HoHoHomiesApplication.class, args);
	}

}
