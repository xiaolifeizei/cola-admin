package com.matrix.cola.web.domain.system.menu.controller;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.system.menu.MenuEntity;
import com.matrix.cola.api.service.system.menu.MenuService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 菜单controller
 *
 * @author : cui_feng
 * @since : 2022-05-11 14:16
 */
@RestController
@RequestMapping("/system/menu")
public class MenuController {

    @DubboReference
    MenuService menuService;

    @PostMapping("/getMenuTree")
    public Result getMenuTree(@RequestBody Query<MenuEntity> query) {
        return menuService.getMenuTree(query);
    }

    @PreAuthorize("hasAuthority('administrator')")
    @PostMapping("/addMenu")
    public Result addMenu(@RequestBody MenuEntity menuPO) {
        return menuService.insert(menuPO);
    }

    @PreAuthorize("hasAuthority('administrator')")
    @PostMapping("/updateMenu")
    public Result updateMenu(@RequestBody MenuEntity menuPO) {
        return menuService.modify(menuPO);
    }

    @PreAuthorize("hasAuthority('administrator')")
    @PostMapping("/deleteMenu")
    public Result deleteMenu(@RequestBody MenuEntity menuPO) {
        return menuService.deleteMenu(menuPO);
    }
}
