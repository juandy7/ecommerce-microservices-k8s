package com.selimhorri.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
public class ProxyClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProxyClientApplication.class, args);
    }

    @RestController
    public static class HealthController {
        @GetMapping("/health")
        public String health() {
            return "success";
        }
    }
}










