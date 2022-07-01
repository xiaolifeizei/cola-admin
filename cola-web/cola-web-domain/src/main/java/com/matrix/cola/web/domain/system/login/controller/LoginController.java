package com.matrix.cola.web.domain.system.login.controller;

import cn.hutool.core.util.ObjectUtil;
import com.matrix.cola.api.Result;
import com.matrix.cola.api.entity.system.user.UserEntity;
import com.matrix.cola.api.service.system.login.LoginService;
import com.matrix.cola.web.auth.util.JwtTokenUtil;
import com.matrix.cola.web.common.utils.WebUtil;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登录接口
 *
 * @author cui_feng
 * @since 2022/5/11 21:35
 */
@RestController
@RequestMapping("/system/login")
public class LoginController {

    @DubboReference
    LoginService loginService;

    /**
     * 登陆时获取用户信息
     *
     * @return 用户详细信息
     */
    @PostMapping("/getUserInfo")
    public Result info() {
        UserEntity userPO = WebUtil.getUser();
        if (ObjectUtil.isNull(userPO)) {
            return Result.err("没有获取到当前用户，请重新登陆后再试");
        }
        return loginService.getUserInfo(userPO.getId());
    }

    /**
     * 获取登录用户的菜单
     * @return 菜单分页对象
     */
    @PostMapping("/getMenuTreeByUser")
    public Result getMenuTreeByUser() {
        UserEntity userPO= WebUtil.getUser();
        if (ObjectUtil.isNull(userPO)) {
            return Result.err("用户不能为空");
        }
        return loginService.getMenuTreeByUserId(userPO.getId());
    }

    /**
     * 获取登录用户的按钮
     * @return 菜单分页对象
     */
    @PostMapping("/getButtonsByUser")
    public Result getButtonsByUser() {
        UserEntity userPO= WebUtil.getUser();
        if (ObjectUtil.isNull(userPO)) {
            return Result.err("用户不能为空");
        }
        return loginService.getButtonsByUserId(userPO.getId());
    }

    @PostMapping("/refreshToken")
    public Result refreshToken() {
        try {
            return Result.ok().put("token",JwtTokenUtil.createToken(WebUtil.getUser()));
        } catch (Exception ignore) {
        }
        // 刷新token失败反回空
        return Result.ok();
    }
}
