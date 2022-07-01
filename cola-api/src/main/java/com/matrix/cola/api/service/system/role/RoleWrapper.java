package com.matrix.cola.api.service.system.role;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.common.service.BaseColaEntityWrapperService;
import com.matrix.cola.api.entity.system.role.RoleEntity;
import com.matrix.cola.api.entity.system.role.RoleEntityWrapper;

/**
 * 角色包装类接口
 *
 * @author : cui_feng
 * @since : 2022-05-31 15:56
 */
public interface RoleWrapper extends BaseColaEntityWrapperService<RoleEntity, RoleEntityWrapper> {

    Result getRoleTree(Query<RoleEntity> query);
}
