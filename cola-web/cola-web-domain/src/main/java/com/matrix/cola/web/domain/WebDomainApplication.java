package com.matrix.cola.web.domain;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * Web 层应用启动器
 * @author cui_feng
 * @since : 2022-04-20 14:18
 */
@SpringBootApplication
@ComponentScan("com.matrix.cola.web")
@EnableDubbo(scanBasePackages = "com.matrix.cola.web")
public class WebDomainApplication {

    public static void main(String[] args) {
        SpringApplication.run(WebDomainApplication.class,args);
    }
}
