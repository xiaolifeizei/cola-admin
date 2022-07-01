package com.matrix.cola.service.system.role.service.impl;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.system.role.RoleEntity;
import com.matrix.cola.api.entity.system.role.RoleEntityWrapper;
import com.matrix.cola.api.entity.system.role.RoleTree;
import com.matrix.cola.api.service.system.role.RoleService;
import com.matrix.cola.service.common.service.AbstractColaEntityWrapperService;
import org.apache.dubbo.config.annotation.DubboService;

/**
 * 角色包装类接口实现类
 *
 * @author : cui_feng
 * @since : 2022-05-31 15:55
 */
@DubboService
public class RoleWrapperServiceImpl extends AbstractColaEntityWrapperService<RoleEntity, RoleEntityWrapper, RoleService> implements com.matrix.cola.api.service.system.role.RoleWrapper {

    @Override
    public Result getRoleTree(Query<RoleEntity> query) {
        return Result.list(RoleTree.getRoleTree(getWrapperList(query)));
    }
}
