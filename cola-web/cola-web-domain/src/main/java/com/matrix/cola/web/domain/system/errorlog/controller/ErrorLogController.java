package com.matrix.cola.web.domain.system.errorlog.controller;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.system.errorlog.ErrorLogEntity;
import com.matrix.cola.api.service.system.errorlog.ErrorLogService;
import com.matrix.cola.api.service.system.errorlog.ErrorLogWrapperService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 错误日志controller
 *
 * @author : cui_feng
 * @since : 2022-06-10 12:45
 */
@RequestMapping("/system/errorlog")
@RestController
public class ErrorLogController {

    @DubboReference
    ErrorLogWrapperService errorLogWrapper;

    @DubboReference
    ErrorLogService errorLogService;

    @PostMapping("/getErrorLogPage")
    @PreAuthorize("hasAuthority('administrator')")
    public Result getErrorLogPage(@RequestBody Query<ErrorLogEntity> query) {
        return Result.page(errorLogWrapper.getWrapperPage(query));
    }

    @PostMapping("/clearErrorLog")
    @PreAuthorize("hasAuthority('administrator')")
    public Result clearErrorLog() {
        return errorLogService.clearErrorLog();
    }
}
