package com.matrix.cola.service.basics.customer.category.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.matrix.cola.api.Result;
import com.matrix.cola.api.entity.basics.customer.category.CustomerCategoryDetailEntity;
import com.matrix.cola.api.service.basics.customer.category.CustomerCategoryDetailService;
import com.matrix.cola.api.service.basics.customer.category.CustomerCategoryService;
import com.matrix.cola.service.basics.customer.category.mapper.CustomerCategoryDetailMapper;
import com.matrix.cola.service.common.service.AbstractEntityService;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collections;

/**
 * 客户分类关联关系服务类
 *
 * @author : cui_feng
 * @since : 2022-06-28 11:00
 */
@DubboService
public class CustomerCategoryDetailServiceImpl extends AbstractEntityService<CustomerCategoryDetailEntity, CustomerCategoryDetailMapper> implements CustomerCategoryDetailService {

    @Autowired
    CustomerCategoryService customerCategoryService;

    @Override
    protected Result beforeAdd(CustomerCategoryDetailEntity po) {
        if (ObjectUtil.isNull(po.getCustomerId())) {
            return Result.err("添加失败，客户不能为空");
        }
        if (ObjectUtil.isNull(po.getCategoryId())) {
            return Result.err("添加失败，物资分类不能为空");
        }
        if (ObjectUtil.isNull(customerCategoryService.getOne(po.getCategoryId()))) {
            return Result.err("添加失败，物资分类不存在");
        }

        LambdaQueryWrapper<CustomerCategoryDetailEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CustomerCategoryDetailEntity::getCategoryId,po.getCategoryId())
                .eq(CustomerCategoryDetailEntity::getCustomerId, po.getCustomerId());
        if (ObjectUtil.isNotNull(getOne(queryWrapper))) {
            return Result.err("添加失败，添加的数据已经存在");
        }

        return super.beforeAdd(po);
    }

    @Override
    public Result getCategoryByCustomerId(Long customerId) {
        if (ObjectUtil.isNull(customerId)) {
            return Result.list(Collections.emptyList());
        }
        LambdaQueryWrapper<CustomerCategoryDetailEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CustomerCategoryDetailEntity::getCustomerId,customerId);
        return Result.list(getList(queryWrapper));
    }

    @Override
    public Result deleteCategoryCustomerDetailByCustomerId(Long goodsId) {
        if (getMapper().deleteCategoryDetailByCustomerId(goodsId) > 0) {
            return Result.ok();
        }
        return Result.err("删除客户分类关联关系失败");
    }
}
