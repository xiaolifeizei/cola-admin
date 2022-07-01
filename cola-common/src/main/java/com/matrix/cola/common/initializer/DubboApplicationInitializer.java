package com.matrix.cola.common.initializer;

import cn.hutool.extra.spring.SpringUtil;
import com.matrix.cola.api.common.service.ColaCacheName;
import com.matrix.cola.api.service.system.monitor.SystemMonitorService;
import com.matrix.cola.common.cache.CacheProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.core.env.Environment;

import java.util.HashSet;

/**
 * Dubbo启动初始化
 *
 * @author : cui_feng
 * @since : 2022-06-13 13:17
 */
@Order(2)
public class DubboApplicationInitializer implements ApplicationRunner {

    @Autowired
    CacheProxy cacheProxy;

    @Autowired
    SystemMonitorService monitorService;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        Environment env = SpringUtil.getApplicationContext().getBean(Environment.class);
        HashSet<String> appNameSet = cacheProxy.getObjectFromLoader(ColaCacheName.DUBBO_APPLICATION_NAME,ColaCacheName.DUBBO_APPLICATION_NAME.cacheName(), () -> {
            HashSet<String> appNames = new HashSet<>();
           appNames.add(env.getProperty("dubbo.application.name"));
           return appNames;
        });
        appNameSet.add(env.getProperty("dubbo.application.name"));
        cacheProxy.put(ColaCacheName.DUBBO_APPLICATION_NAME,ColaCacheName.DUBBO_APPLICATION_NAME.cacheName(),appNameSet);
    }


}
