package com.matrix.cola.service.common.log.service.impl;

import com.matrix.cola.api.entity.system.datalog.DataLogEntity;
import com.matrix.cola.api.entity.system.datalog.DataLogEntityWrapper;
import com.matrix.cola.api.service.system.datalog.DataLogService;
import com.matrix.cola.api.service.system.datalog.DataLogWrapperService;
import com.matrix.cola.service.common.service.AbstractColaEntityWrapperService;
import org.apache.dubbo.config.annotation.DubboService;

/**
 * 系统日志包装类接口实现类
 *
 * @author : cui_feng
 * @since : 2022-07-01 10:58
 */
@DubboService
public class DataLogWrapperServiceImpl extends AbstractColaEntityWrapperService<DataLogEntity, DataLogEntityWrapper, DataLogService> implements DataLogWrapperService {


    @Override
    public DataLogEntityWrapper entityWrapper(DataLogEntity entity) {
        return new DataLogEntityWrapper();
    }
}
