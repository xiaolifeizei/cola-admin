package com.matrix.cola.api.service.system.group;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.common.service.BaseEntityService;
import com.matrix.cola.api.entity.system.group.GroupEntity;
import com.matrix.cola.api.entity.system.user.UserEntity;

/**
 * 组织机构实体类服务接口
 *
 * @author : cui_feng
 * @since : 2022-05-30 15:03
 */
public interface GroupService extends BaseEntityService<GroupEntity> {

    /**
     * 获取该用户的组织机构树<br>
     * 查询该用户的所属机构及其下属机构
     *
     * @param user 用户
     * @return 返回统一类型
     */
    Result getGroupTreeByUser(UserEntity user);

    /**
     * 获取当前用户的组织机构树<br>
     * 查询当前用户的所属机构及其下属机构
     *
     * @return 返回统一类型
     */
    Result getGroupTreeByCurrentUser();
    /**
     * 通过查询条件查询组织机构树
     * @param query 查询条件
     * @return 返回统一类型
     */
    Result getGroupTree(Query<GroupEntity> query);
}
