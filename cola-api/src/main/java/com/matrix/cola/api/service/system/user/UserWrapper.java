package com.matrix.cola.api.service.system.user;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.common.service.BaseColaEntityWrapperService;
import com.matrix.cola.api.entity.system.user.UserEntity;
import com.matrix.cola.api.entity.system.user.UserEntityWrapper;

/**
 * 用户实体包装类服务接口
 *
 * @author : cui_feng
 * @since : 2022-06-02 11:51
 */
public interface UserWrapper extends BaseColaEntityWrapperService<UserEntity, UserEntityWrapper> {

    /**
     * 获取用户的分页列表数据，只能查看用户所属机构及下级机构的用户
     * @param query 查询条件
     * @return 返回统一查询结果
     */
    Result getCurrentUsersPage(Query<UserEntity> query);
}
