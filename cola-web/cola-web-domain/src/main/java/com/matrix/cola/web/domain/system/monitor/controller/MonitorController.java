package com.matrix.cola.web.domain.system.monitor.controller;

import cn.hutool.core.util.StrUtil;
import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.service.ColaCacheName;
import com.matrix.cola.api.entity.system.monitor.MonitorInfo;
import com.matrix.cola.api.service.system.monitor.SystemMonitorService;
import com.matrix.cola.common.cache.CacheProxy;
import com.matrix.cola.common.utils.DubboServiceUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

/**
 * 系统监控Controller
 *
 * @author : cui_feng
 * @since : 2022-06-13 10:44
 */
@RestController
@RequestMapping("/system/monitor")
public class MonitorController {

    @Autowired
    CacheProxy cacheProxy;

    @PostMapping("/getSystemMonitor")
    @PreAuthorize("hasAuthority('administrator')")
    public Result getSystemMonitor(String applicationName) {
        if (StrUtil.isNotEmpty(applicationName)) {
            try {
                SystemMonitorService monitorService = DubboServiceUtil.getService(SystemMonitorService.class,applicationName);
                return Result.ok().put("monitor", monitorService.getSystemMonitor());
            } catch (Exception ignored) {
                return Result.ok().put("monitor", new MonitorInfo());
            }
        }
        return Result.ok();
    }

    @PostMapping("/getApplicationNames")
    @PreAuthorize("hasAuthority('administrator')")
    public Result getApplicationNames(){
        return Result.list(new ArrayList<String>(cacheProxy.getObject(ColaCacheName.DUBBO_APPLICATION_NAME,ColaCacheName.DUBBO_APPLICATION_NAME.cacheName())));
    }
}
