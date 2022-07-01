package com.matrix.cola.service.order;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * 订单服务启动类
 *
 * @author : cui_feng
 * @since : 2022-04-07 08:48
 */
@SpringBootApplication
@MapperScan("com.matrix.cola.service.*.*.mapper")
@ComponentScan("com.matrix.cola.service")
@EnableDubbo(scanBasePackages = "com.matrix.cola.service")
public class ServiceOrderApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceOrderApplication.class,args);
    }
}
