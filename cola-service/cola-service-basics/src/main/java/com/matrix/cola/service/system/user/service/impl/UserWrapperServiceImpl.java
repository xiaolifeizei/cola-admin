package com.matrix.cola.service.system.user.service.impl;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.common.service.ColaCacheName;
import com.matrix.cola.api.entity.system.group.GroupEntity;
import com.matrix.cola.api.entity.system.user.UserEntity;
import com.matrix.cola.api.entity.system.user.UserEntityWrapper;
import com.matrix.cola.api.service.system.group.GroupService;
import com.matrix.cola.api.service.system.user.UserService;
import com.matrix.cola.service.common.service.AbstractColaEntityWrapperService;
import com.matrix.cola.service.common.utils.DubboUtil;
import com.matrix.cola.service.common.utils.QueryUtil;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 用户实体包装服务接口实现类
 *
 * @author : cui_feng
 * @since : 2022-06-02 11:58
 */
@DubboService
public class UserWrapperServiceImpl extends AbstractColaEntityWrapperService<UserEntity, UserEntityWrapper, UserService> implements com.matrix.cola.api.service.system.user.UserWrapper {


    @Autowired
    GroupService groupService;

    @Override
    public Result getCurrentUsersPage(Query<UserEntity> query) {

        if (ObjectUtil.isNull(query)) {
            return Result.err("查询失败，没有获取到参数");
        }

        QueryUtil<UserEntity> queryUtil = new QueryUtil<>(query);
        QueryWrapper<UserEntity> queryWrapper = queryUtil.getWrapper();

        if (ObjectUtil.isNotNull(query.getData()) && StrUtil.isNotEmpty(query.getData().getGroupId())) {
            String groupId = query.getData().getGroupId();
            queryWrapper.and(condition -> {
                condition.or(cd -> {
                    cd.eq("group_id",groupId)
                            .or()
                            .likeRight("group_id", groupId + ",")
                            .or()
                            .likeLeft("group_id", "," + groupId)
                            .or()
                            .like("group_id",groupId);
                });
            });
        }

        // 超管跳过
        if (!DubboUtil.isAdministrator()) {
            UserEntity userEntity = DubboUtil.getUser();
            if (ObjectUtil.isNull(userEntity) || StrUtil.isEmpty(userEntity.getGroupId())) {
                return Result.err("查询失败，您不属于任何机构，不能查询");
            }
            String [] groupIds = userEntity.getGroupId().split(",");
            queryWrapper.and(condition -> {
                for (String groupId : groupIds) {
                    if (!NumberUtil.isLong(groupId)) {
                        continue;
                    }
                    GroupEntity groupPO = cacheProxy.getObjectFromLoader(ColaCacheName.GROUP_ENTITY, groupId, () -> {
                        LambdaQueryWrapper<GroupEntity> q = new LambdaQueryWrapper<>();
                        q.eq(GroupEntity::getId, groupId);
                        return groupService.getOne(q);
                    });
                    if (ObjectUtil.isEmpty(groupPO)) {
                        continue;
                    }
                    condition.or(cd -> {
                        cd.eq("group_id",groupId)
                                .or()
                                .likeRight("group_id", groupId + ",")
                                .or()
                                .likeLeft("group_id", "," + groupId)
                                .or()
                                .like("group_id",groupId);
                    });
                }
            });

        }
        return Result.page(entityPageWrapper(getService().getPage(queryUtil.getPage(),queryWrapper)));
    }
}
