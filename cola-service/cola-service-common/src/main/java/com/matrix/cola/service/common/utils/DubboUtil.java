package com.matrix.cola.service.common.utils;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.spring.SpringUtil;
import cn.hutool.json.JSONUtil;
import com.matrix.cola.api.ColaConstant;
import com.matrix.cola.api.common.service.ColaCacheName;
import com.matrix.cola.api.entity.system.user.UserEntity;
import com.matrix.cola.common.cache.CacheProxy;
import org.apache.dubbo.rpc.Invocation;

import java.util.List;

/**
 * 工具类
 *
 * @author : cui_feng
 * @since : 2022-05-13 13:56
 */
public class DubboUtil {

    /**
     * 保存当前用户
     */
    private static final ThreadLocal<UserEntity> userThreadLocal = new ThreadLocal<>();

    /**
     * 保存调用服务名
     */
    private static final ThreadLocal<String> invokeNameTreadLocal = new ThreadLocal<>();

    /**
     * 从ThreadLocal中获取用户
     * @return 用户实体类
     */
    public static UserEntity getUser() {
        return userThreadLocal.get();
    }

    /**
     * 从Invocation中获取用户，此方法用在Filter中
     * @param invocation dubbo的调用对象
     * @return 用户实体类
     */
    public static UserEntity getUser(Invocation invocation) {

        if (ObjectUtil.isNotNull(getUser())) {
            return getUser();
        }

        UserEntity userPO = null;
        String userJson = invocation.getAttachment("Cola_Web_User");
        if (StrUtil.isNotEmpty(userJson)) {
            userPO = JSONUtil.toBean(userJson, UserEntity.class);
        }
        if (ObjectUtil.isNotNull(userPO)) {
            setUser(userPO);
        }
        return getUser();
    }

    /**
     * 判断当前用户是否为超管
     * @return boolean
     */
    public static boolean isAdministrator() {
        UserEntity userPO = getUser();
        if (ObjectUtil.isNull(userPO) || ObjectUtil.isNull(userPO.getId())) {
            return false;
        }
        CacheProxy cacheProxy = null;
        List<Long> roleIds = null;
        try {
            cacheProxy = SpringUtil.getBean(CacheProxy.class);
            if (ObjectUtil.isNotNull(cacheProxy)) {
                roleIds = cacheProxy.getObject(ColaCacheName.USER_ROLE_IDS,userPO.getId().toString());
            } else {
                return false;
            }
        } catch (Exception ignored) {
        }

        if (roleIds == null) {
            return false;
        }
        return roleIds.contains(ColaConstant.ADMINISTRATOR_ID);
    }

    /**
     * 从Filter中获取用户并将用户添加到ThreadLocal
     * @param userPO 用户对象
     */
    public static void setUser(UserEntity userPO) {
        userThreadLocal.set(userPO);
    }

    /**
     * 清除ThreadLocal中的用户
     */
    public static void clearUser() {
        userThreadLocal.remove();
    }

    /**
     * 从ThreadLocal中获取invokeName
     * @return
     */
    public static String getInvokeName() {
        return invokeNameTreadLocal.get();
    }

    /**
     * 此方法用在Filter中，添加的invokeName用于判断调用链是否执行完毕
     * @param invokeName 当前执行的方法名
     */
    public static void setInvokeName(String invokeName) {
        invokeNameTreadLocal.set(invokeName);
    }

    /**
     * 清除ThreadLocal中的invokeName
     */
    public static void clearInvokeName() {
        invokeNameTreadLocal.remove();
    }
}
