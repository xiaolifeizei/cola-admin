<p align="center">
	<img alt="logo" width="120" height="120"  src="https://s2.loli.net/2022/07/01/hwrfbyMKxp7HjVi.png">
</p>
<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">Cola-Admin v2.1</h1>
<h4 align="center">基于SpringBoot + Dubbo + Element Ui开发的企业级微服务权限管理系统</h4>
<p align="center">
	<a href="https://github.com/xiaolifeizei/cola-admin"><img src="https://img.shields.io/badge/ColaAdmin-v2.1-green"></a>
	<a href="https://github.com/xiaolifeizei/cola-admin/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-Apache%20License%202.0-green"></a>
</p>


## 平台简介

目前微服务架构很火热，基于微服务的权限管理系统框架也有很多，但大都是基于Spring Cloud或Spring Cloud Alibaba的。对于Dubbo这样一个优秀的开源框架，网上很少有现成的微服务开发框架，于是手撸了一个。

Cola-Admin是一套全部开源的开发平台，毫无保留给个人及企业免费使用。

* Nacos注册中心
* 前后端分离
* 支持数据权限
* Springboot 2.6.6
* MyBatis-Plus 3.5.2
* Apache Dubbo 3.0.7
* Nacos 2.1.0
* Vue 2.6.10

后端代码：[Cola-Admin](https://github.com/xiaolifeizei/cola-admin)
前端代码：[Cola-Ui](https://github.com/xiaolifeizei/cola-ui)


## 功能介绍

1.  用户管理：用户是系统操作者，该功能主要完成系统用户管理。
2.  机构管理：配置系统组织机构（公司、部门），树结构展现。
3.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
4.  角色管理：配置系统角色，给角色分配菜单、按钮。
5.  数据权限：配置业务的数据查询权限，可按全局、按机构、按角色、自定义。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  通知公告：系统通知公告信息发布维护。
8.  系统日志：系统正常操作日志记录和查询。
9.  错误日志： 系统异常信息日志记录和查询。
10. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
11. 连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。
12. 业务案例之客户管理：客户增删查改、客户分类增删查改。
13. 业务案例之物资管理：物资增删查改、物资分类增删查改、物资规格增删查改。

## 在线演示

演示地址：http://www.cuifeng.vip  

## 演示图

<table>
    <tr>
        <td><img alt="登陆页面" src="https://s2.loli.net/2022/07/01/bNvuwGRP3hQTHUo.png"/></td>
        <td><img alt="菜单管理" src="https://s2.loli.net/2022/07/01/ukYInAX58N2e419.png"/></td>
    </tr>
    <tr>
        <td><img alt="错误日志" src="https://s2.loli.net/2022/07/01/F1Ego9SmxUTbKQh.png"/></td>
        <td><img alt="错误日志详细信息" src="https://s2.loli.net/2022/07/01/zBe9PKr21IfyFaO.png"/></td>
    </tr>
    <tr>
        <td><img alt="服务监控" src="https://s2.loli.net/2022/07/01/3nqXB2KdWH9fyLE.png"/></td>
        <td><img alt="机构管理" src="https://s2.loli.net/2022/07/01/ScaW8f5L2vTHlm3.png"/></td>
    </tr>
    <tr>
        <td><img alt="角色管理" src="https://s2.loli.net/2022/07/01/KoE6AziC48Ok5D2.png"/></td>
        <td><img alt="分配菜单" src="https://s2.loli.net/2022/07/01/PlSOTxLUn2Dr8fi.png"/></td>
    </tr>
    <tr>
        <td><img alt="数据权限" src="https://s2.loli.net/2022/07/01/OloHiT1tqCvxEGg.png"/></td>
        <td><img alt="数据权限配置" src="https://s2.loli.net/2022/07/01/JMoz2nTk1DLh3wY.png"/></td>
    </tr>
    <tr>
        <td><img alt="添加通知" src="https://s2.loli.net/2022/07/01/v1UStybOPl2QEiu.png"/></td>
        <td><img alt="通知公告" src="https://s2.loli.net/2022/07/01/JpZHYTqEN1Rlj3G.png"/></td>
    </tr>
    <tr>
        <td><img alt="系统日志" src="https://s2.loli.net/2022/07/01/YoNq6nTmaeHCFhd.png"/></td>
        <td><img alt="系统日志详细信息" src="https://s2.loli.net/2022/07/01/2I3eKzuVckxRB4X.png"/></td>
    </tr>
    <tr>
        <td><img alt="用户管理" src="https://s2.loli.net/2022/07/01/tBoJIQg48iC6DaV.png"/></td>
        <td><img alt="字典管理" src="https://s2.loli.net/2022/07/01/8QM9f1ZtjWxUqJh.png"/></td>
    </tr>
</table>

## 作者说明

QQ：76216170
Email：xiaolifeizei@163.com


## 如果感觉对你有用请作者喝杯饮料吧

<img src="https://s2.loli.net/2022/07/01/2x4SseYukOV1nyr.jpg" alt="微信收款码.jpg" style="zoom:20%;" />

<img src="https://s2.loli.net/2022/07/01/vzUa7iCXBe2GZhm.jpg" alt="微信收款码.jpg" style="zoom:20%;" />