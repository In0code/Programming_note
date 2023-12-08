package kr.co.sist;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.context.WebApplicationContext;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;

@SpringBootApplication
public class BootMybatisApplication extends SpringBootServletInitializer{

	

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(BootMybatisApplication.class);
	}
	

	public static void main(String[] args) {
		SpringApplication.run(BootMybatisApplication.class, args);
	}

}
