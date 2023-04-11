<p align="center">
	<img alt="logo" width="120" height="120"  src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/picgo/image-20230411111455594.png">
</p>
<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">Cola-Admin v2.1</h1>
<h4 align="center">基于SpringBoot + Dubbo + Element Ui开发的企业级微服务权限管理系统</h4>
<p align="center">
	<a href="https://gitee.com/xiaolifeizei/cola-admin"><img src="https://img.shields.io/badge/ColaAdmin-v2.1-green"></a>
	<a href="https://gitee.com/xiaolifeizei/cola-admin/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-Apache%20License%202.0-green"></a>
</p>



## 平台简介

目前微服务架构很火热，基于微服务的权限管理系统框架也有很多，但大都是基于Spring Cloud或Spring Cloud Alibaba的。对于Dubbo这样一个优秀的开源框架，网上很少有现成的微服务开发框架，于是手撸了一个。

* Nacos注册中心
* 前后端分离
* 支持数据权限
* Springboot 2.6.6
* MyBatis-Plus 3.5.2
* Apache Dubbo 3.0.7
* Nacos 2.1.0
* Vue 2.6.10

后端代码：[Cola-Admin](https://gitee.com/xiaolifeizei/cola-admin)

前端代码：[Cola-Ui](https://gitee.com/xiaolifeizei/cola-ui)

在线演示：[Cola-Admin](http://www.cola-admin.vip)

- 默认用户名：admin

- 默认的密码：123123

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

## 在线文档

- 后端文档：https://gitee.com/xiaolifeizei/cola-admin/wikis/%E5%90%8E%E7%AB%AF%E6%96%87%E6%A1%A3
- 前端文档：https://gitee.com/xiaolifeizei/cola-admin/wikis/%E5%89%8D%E7%AB%AF%E6%96%87%E6%A1%A3
- 部署文档：https://gitee.com/xiaolifeizei/cola-admin/wikis/%E9%83%A8%E7%BD%B2%E6%96%87%E6%A1%A3

## 演示图

<table>
    <tr>
        <td><img alt="登陆页面" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E7%99%BB%E9%99%86%E9%A1%B5%E9%9D%A2.png"/></td>
        <td><img alt="菜单管理" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E8%8F%9C%E5%8D%95%E7%AE%A1%E7%90%86.png"/></td>
    </tr>
    <tr>
        <td><img alt="错误日志" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E9%94%99%E8%AF%AF%E6%97%A5%E5%BF%97.png"/></td>
        <td><img alt="错误日志详细信息" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E9%94%99%E8%AF%AF%E6%97%A5%E5%BF%97%E8%AF%A6%E7%BB%86%E4%BF%A1%E6%81%AF.png"/></td>
    </tr>
    <tr>
        <td><img alt="服务监控" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E6%9C%8D%E5%8A%A1%E7%9B%91%E6%8E%A7.png"/></td>
        <td><img alt="机构管理" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E6%9C%BA%E6%9E%84%E7%AE%A1%E7%90%86.png"/></td>
    </tr>
    <tr>
        <td><img alt="角色管理" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%86.png"/></td>
        <td><img alt="分配菜单" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%86%E5%88%86%E9%85%8D%E8%8F%9C%E5%8D%95.png"/></td>
    </tr>
    <tr>
        <td><img alt="数据权限" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E6%95%B0%E6%8D%AE%E6%9D%83%E9%99%90.png"/></td>
        <td><img alt="数据权限配置" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E6%95%B0%E6%8D%AE%E6%9D%83%E9%99%90%E9%85%8D%E7%BD%AE.png"/></td>
    </tr>
    <tr>
        <td><img alt="添加通知" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E6%B7%BB%E5%8A%A0%E9%80%9A%E7%9F%A5.png"/></td>
        <td><img alt="通知公告" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8A.png"/></td>
    </tr>
    <tr>
        <td><img alt="系统日志" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E7%B3%BB%E7%BB%9F%E6%97%A5%E5%BF%97.png"/></td>
        <td><img alt="系统日志详细信息" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E7%B3%BB%E7%BB%9F%E6%97%A5%E5%BF%97%E8%AF%A6%E7%BB%86%E4%BF%A1%E6%81%AF.png"/></td>
    </tr>
    <tr>
        <td><img alt="用户管理" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86.png"/></td>
        <td><img alt="字典管理" src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%86.png"/></td>
    </tr>
</table>


## 作者说明

QQ：76216170

Email：xiaolifeizei@163.com


## 如果感觉对你有用请作者喝杯饮料吧

<table>
    <tr>
        <td>
	<img src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E6%94%AF%E4%BB%98%E5%AE%9D%E6%94%B6%E6%AC%BE%E7%A0%81.jpg" alt="支付宝收款码.jpg" style="width: 248; height: 337" />
	</td>
	<td>
	<img src="https://raw.githubusercontent.com/xiaolifeizei/myImages/master/static/%E5%BE%AE%E4%BF%A1%E6%94%B6%E6%AC%BE%E7%A0%81.jpg" alt="微信收款码.jpg" style="width: 248; height: 337" />
	</td>
    </tr>
</table>



