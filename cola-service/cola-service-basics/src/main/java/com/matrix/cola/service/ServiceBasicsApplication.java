package com.matrix.cola.service;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 基础服务启动类
 *
 * @author : cui_feng
 * @since : 2022-04-07 08:48
 */
@SpringBootApplication
@MapperScan("com.matrix.cola.service.**.mapper")
@EnableDubbo(scanBasePackages = "com.matrix.cola.service")
public class ServiceBasicsApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceBasicsApplication.class,args);
    }
}
