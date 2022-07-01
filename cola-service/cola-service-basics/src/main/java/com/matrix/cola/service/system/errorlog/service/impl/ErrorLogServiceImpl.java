package com.matrix.cola.service.system.errorlog.service.impl;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.entity.system.errorlog.ErrorLogEntity;
import com.matrix.cola.api.service.system.errorlog.ErrorLogService;
import com.matrix.cola.service.common.service.AbstractColaEntityService;
import com.matrix.cola.service.system.errorlog.mapper.ErrorLogMapper;
import org.apache.dubbo.config.annotation.DubboService;

/**
 * 系统错误接口实现类
 *
 * @author : cui_feng
 * @since : 2022-06-10 12:44
 */
@DubboService
public class ErrorLogServiceImpl extends AbstractColaEntityService<ErrorLogEntity, ErrorLogMapper> implements ErrorLogService {

    @Override
    public Result clearErrorLog() {
        if (getMapper().clearErrorLog() > 0) {
            return Result.ok();
        }
        return Result.err("清空失败");
    }
}
