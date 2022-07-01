package com.matrix.cola.api.service.system.errorlog;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.service.BaseColaEntityService;
import com.matrix.cola.api.entity.system.errorlog.ErrorLogEntity;

/**
 * 系统错误实体类服务接口
 *
 * @author : cui_feng
 * @since : 2022-06-10 12:42
 */
public interface ErrorLogService extends BaseColaEntityService<ErrorLogEntity> {

    /**
     * 清空错误日志，物理删除
     * @return
     */
    Result clearErrorLog();
}
