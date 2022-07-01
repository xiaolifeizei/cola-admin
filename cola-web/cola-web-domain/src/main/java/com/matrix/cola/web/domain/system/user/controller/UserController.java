package com.matrix.cola.web.domain.system.user.controller;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.system.user.GrantRole;
import com.matrix.cola.api.entity.system.user.UserEntity;
import com.matrix.cola.api.entity.system.user.UserEntityWrapper;
import com.matrix.cola.api.service.system.role.RoleUserService;
import com.matrix.cola.api.service.system.user.UserService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户管理
 *
 * @author : cui_feng
 * @since : 2022-05-05 15:04
 */
@RestController
@RequestMapping("/system/user")
public class UserController {

    @DubboReference
    UserService userService;

    @DubboReference
    RoleUserService roleUserService;

    @DubboReference
    com.matrix.cola.api.service.system.user.UserWrapper userWrapper;

    @PostMapping("/getUserPage")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result getUserPage(@RequestBody Query<UserEntity> query) {
        return userWrapper.getCurrentUsersPage(query);
    }

    @PostMapping("/addUser")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result addUser(@RequestBody UserEntity userPO) {
        return userService.insert(userPO);
    }

    @PostMapping("/updateUser")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result updateUser(@RequestBody UserEntity userPO) {
        return userService.modify(userPO);
    }

    @PostMapping("/deleteUser")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result deleteUser(@RequestBody UserEntity userPO) {
        return userService.remove(userPO);
    }

    @PostMapping("/getRoleUsersByUser")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result getRoleUsersByUser(@RequestBody UserEntity userPO) {
        return roleUserService.getRoleUsersByUser(userPO);
    }

    @PostMapping("/grantRoles")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result grantRoles(@RequestBody GrantRole grantRole) {
        return userService.grantRoles(grantRole);
    }
    @PostMapping("/updateUserInfo")
    public Result updateUserInfo(@RequestBody UserEntityWrapper user) {
        return userService.updateUserInfo(user);
    }

    @PostMapping("/resetPassword")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result resetPassword(@RequestBody UserEntity userPO) {
        return userService.resetPassword(userPO);
    }
}
