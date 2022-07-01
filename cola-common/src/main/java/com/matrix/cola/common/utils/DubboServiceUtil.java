package com.matrix.cola.common.utils;

import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.spring.SpringUtil;
import com.matrix.cola.api.common.service.BaseService;
import org.apache.dubbo.config.ReferenceConfig;
import org.apache.dubbo.config.RegistryConfig;
import org.apache.dubbo.config.utils.SimpleReferenceCache;
import org.springframework.core.env.Environment;

/**
 * Dubbo服务工具类
 *
 * @author : cui_feng
 * @since : 2022-06-13 16:56
 */
public class DubboServiceUtil {

    /**
     * 手动获取提供者
     *
     * @param interfaceClass 接口类
     * @param group 分组
     * @param version 版本
     * @return 提供者
     */
    public static  <T> T getService(Class<T> interfaceClass,String group,String version) {

        Environment environment = SpringUtil.getApplicationContext().getBean(Environment.class);
        RegistryConfig registry = new RegistryConfig();
        registry.setAddress(environment.getProperty("dubbo.registry.address"));

        ReferenceConfig<T> reference = new ReferenceConfig<>();
        reference.setRegistry(registry);
        reference.setInterface(interfaceClass);
        reference.setRetries(0);

        if (StrUtil.isNotEmpty(group)) {
            reference.setGroup(group);
        }

        if (StrUtil.isNotEmpty(version)) {
            reference.setVersion(version);
        }

        SimpleReferenceCache cache = SimpleReferenceCache.getCache();

        return cache.get(reference);
    }

    /**
     * 手动获取服务提供者
     *
     * @param interfaceClass 接口类
     * @param version 版本
     * @return 提供者
     */
    public static  <T extends BaseService> T getService(Class<T> interfaceClass, String version) {
        return getService(interfaceClass,null,version);
    }

    /**
     * 手动获取服务提供者
     *
     * @param interfaceClass 接口类
     * @return 提供者
     */
    public static  <T extends BaseService> T getService(Class<T> interfaceClass) {
        return getService(interfaceClass,null,null);
    }
}
