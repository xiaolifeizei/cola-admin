package com.matrix.cola.web.domain.system.datascope.controller;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.system.datascope.DataScopeEntity;
import com.matrix.cola.api.service.system.datascope.DataScopeService;
import com.matrix.cola.api.service.system.datascope.DataScopeWrapperService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 数据权限Controller
 *
 * @author : cui_feng
 * @since : 2022-06-06 11:30
 */
@RestController
@RequestMapping("/system/datascope")
public class DataScopeController {

    @DubboReference
    DataScopeService dataScopeService;

    @DubboReference
    DataScopeWrapperService dataScopeWrapper;

    @PostMapping("/getDataScopeList")
    @PreAuthorize("hasAuthority('administrator')")
    public Result getDataScopeList(@RequestBody Query<DataScopeEntity> query) {
        return Result.list(dataScopeWrapper.getWrapperList(query));
    }

    @PostMapping("/addDataScope")
    @PreAuthorize("hasAuthority('administrator')")
    public Result addDataScope(@RequestBody DataScopeEntity dataScopePO) {
        return dataScopeService.insert(dataScopePO);
    }

    @PostMapping("/updateDataScope")
    @PreAuthorize("hasAuthority('administrator')")
    public Result updateDataScope(@RequestBody DataScopeEntity dataScopePO) {
        return dataScopeService.modify(dataScopePO);
    }

    @PostMapping("/deleteDataScope")
    @PreAuthorize("hasAuthority('administrator')")
    public Result deleteDataScope(@RequestBody DataScopeEntity dataScopePO) {
        return dataScopeService.deleteDataScope(dataScopePO);
    }
}
