package com.matrix.cola.web.domain.system.role.controller;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.system.role.GrantMenu;
import com.matrix.cola.api.entity.system.role.RoleEntity;
import com.matrix.cola.api.service.system.role.RoleMenuService;
import com.matrix.cola.api.service.system.role.RoleService;
import com.matrix.cola.api.service.system.role.RoleWrapper;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 角色管理
 *
 * @author : cui_feng
 * @since : 2022-05-30 13:18
 */
@RestController
@RequestMapping("/system/role")
public class RoleController {

    @DubboReference
    RoleService roleService;

    @DubboReference
    RoleMenuService roleMenuService;

    @DubboReference
    RoleWrapper roleWrapper;

    @PostMapping("/getRoleTree")
    public Result getRoleTree(@RequestBody Query<RoleEntity> query) {
        return roleWrapper.getRoleTree(query);
    }

    @PostMapping("/getRoleList")
    public Result getRoleList(@RequestBody Query<RoleEntity> query) {
        return Result.list(roleService.getList(query));
    }

    @PostMapping("/deleteRole")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result deleteRole(@RequestBody RoleEntity role) {
        return roleService.deleteRole(role);
    }

    @PostMapping("/updateRole")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result updateRole(@RequestBody RoleEntity role) {
        return roleService.modify(role);
    }

    @PostMapping("addRole")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result addRole(@RequestBody RoleEntity role) {
        return roleService.insert(role);
    }

    @PostMapping("/getRoleMenusByRole")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result getRoleMenusByRole(@RequestBody RoleEntity rolePO) {
        return roleMenuService.getRoleMenusByRoleId(rolePO);
    }

    @PostMapping("/grantMenus")
    @PreAuthorize("hasAuthority('administrator')" + "|| hasAuthority('admin')")
    public Result grantMenus(@RequestBody GrantMenu grantMenu) {
        return roleMenuService.grantMenus(grantMenu);
    }
}
