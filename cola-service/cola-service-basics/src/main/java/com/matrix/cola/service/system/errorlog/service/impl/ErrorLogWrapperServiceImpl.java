package com.matrix.cola.service.system.errorlog.service.impl;

import com.matrix.cola.api.entity.system.errorlog.ErrorLogEntity;
import com.matrix.cola.api.entity.system.errorlog.ErrorLogEntityWrapper;
import com.matrix.cola.api.service.system.errorlog.ErrorLogService;
import com.matrix.cola.api.service.system.errorlog.ErrorLogWrapperService;
import com.matrix.cola.service.common.service.AbstractColaEntityWrapperService;
import org.apache.dubbo.config.annotation.DubboService;

/**
 * 错误日志包装类
 *
 * @author : cui_feng
 * @since : 2022-06-10 13:20
 */
@DubboService
public class ErrorLogWrapperServiceImpl extends AbstractColaEntityWrapperService<ErrorLogEntity, ErrorLogEntityWrapper, ErrorLogService> implements ErrorLogWrapperService {
    @Override
    public ErrorLogEntityWrapper entityWrapper(ErrorLogEntity entity) {
        return new ErrorLogEntityWrapper();
    }
}
