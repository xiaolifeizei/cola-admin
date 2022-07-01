package com.matrix.cola.service.system.datascope.service.impl;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.matrix.cola.api.common.service.ColaCacheName;
import com.matrix.cola.api.entity.system.datascope.DataScopeEntity;
import com.matrix.cola.api.entity.system.datascope.DataScopeEntityWrapper;
import com.matrix.cola.api.entity.system.role.RoleEntity;
import com.matrix.cola.api.service.system.datascope.DataScopeService;
import com.matrix.cola.api.service.system.datascope.DataScopeWrapperService;
import com.matrix.cola.api.service.system.role.RoleService;
import com.matrix.cola.service.common.service.AbstractColaEntityWrapperService;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 数据权限包装接口实现类
 *
 * @author : cui_feng
 * @since : 2022-06-08 08:56
 */
@DubboService
public class DataScopeWrapperServiceImpl extends AbstractColaEntityWrapperService<DataScopeEntity, DataScopeEntityWrapper, DataScopeService> implements DataScopeWrapperService {

    @Autowired
    RoleService roleService;

    @Override
    public DataScopeEntityWrapper entityWrapper(DataScopeEntity entity) {
        DataScopeEntityWrapper dataScopeWrapper = new DataScopeEntityWrapper();
        String roleIds = entity.getRoleIds();
        if (StrUtil.isNotEmpty(roleIds)) {
            String [] roleIdArr = roleIds.split(",");
            if (roleIdArr.length > 0) {
                StringBuilder roleNames = new StringBuilder();
                for (String roleId : roleIdArr) {
                    if (StrUtil.isEmpty(roleId) || !NumberUtil.isLong(roleId)) {
                        continue;
                    }
                    String roleName = cacheProxy.getObjectFromLoader(ColaCacheName.ROLE_NAME, roleId, () -> {
                        RoleEntity rolePO = roleService.getOne(Long.valueOf(roleId));
                        if (ObjectUtil.isNull(rolePO)) {
                            return null;
                        }
                        return rolePO.getName();
                    });
                    if (StrUtil.isEmpty(roleName)) {
                        continue;
                    }
                    roleNames.append(roleName).append(",");
                }

                if (roleNames.toString().endsWith(",")) {
                    roleNames = new StringBuilder(roleNames.substring(0, roleNames.length() - 1));
                }
                dataScopeWrapper.setRoleNames(roleNames.toString());
            }
        }
        return dataScopeWrapper;
    }
}
