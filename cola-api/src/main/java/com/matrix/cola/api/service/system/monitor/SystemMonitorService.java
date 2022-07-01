package com.matrix.cola.api.service.system.monitor;

import com.matrix.cola.api.common.service.BaseService;
import com.matrix.cola.api.entity.system.monitor.MonitorInfo;

/**
 * 系统监控接口
 *
 * @author : cui_feng
 * @since : 2022-06-11 00:28
 */
public interface SystemMonitorService extends BaseService {

    /**
     * 获取系统信息
     * @return SystemMonitor
     */
    MonitorInfo getSystemMonitor();
}
