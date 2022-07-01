package com.matrix.cola.service.basics.goods.category.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.matrix.cola.api.Result;
import com.matrix.cola.api.entity.basics.goods.category.GoodsCategoryDetailEntity;
import com.matrix.cola.api.service.basics.goods.category.GoodsCategoryDetailService;
import com.matrix.cola.api.service.basics.goods.category.GoodsCategoryService;
import com.matrix.cola.service.basics.goods.category.mapper.CategoryGoodsMapper;
import com.matrix.cola.service.common.service.AbstractEntityService;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collections;

/**
 * 物资分类与物资关联关系接口实现类
 *
 * @author : cui_feng
 * @since : 2022-06-24 10:14
 */
@DubboService
public class GoodsCategoryDetailServiceImpl extends AbstractEntityService<GoodsCategoryDetailEntity, CategoryGoodsMapper> implements GoodsCategoryDetailService {

    @Autowired
    GoodsCategoryService goodsCategoryService;

    @Override
    public Result beforeAdd(GoodsCategoryDetailEntity po) {

        if (ObjectUtil.isNull(po.getGoodsId())) {
            return Result.err("添加失败，物资不能为空");
        }
        if (ObjectUtil.isNull(po.getCategoryId())) {
            return Result.err("添加失败，物资分类不能为空");
        }
        if (ObjectUtil.isNull(goodsCategoryService.getOne(po.getCategoryId()))) {
            return Result.err("添加失败，物资分类不存在");
        }

        LambdaQueryWrapper<GoodsCategoryDetailEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(GoodsCategoryDetailEntity::getCategoryId,po.getCategoryId())
                .eq(GoodsCategoryDetailEntity::getGoodsId, po.getGoodsId());
        if (ObjectUtil.isNotNull(getOne(queryWrapper))) {
            return Result.err("添加失败，添加的数据已经存在");
        }

        return super.beforeAdd(po);
    }

    @Override
    public Result getCategoryByGoodsId(Long goodsId) {
        if (ObjectUtil.isNull(goodsId)) {
            return Result.list(Collections.emptyList());
        }
        LambdaQueryWrapper<GoodsCategoryDetailEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(GoodsCategoryDetailEntity::getGoodsId,goodsId);
        return Result.list(getList(queryWrapper));
    }

    @Override
    public Result deleteCategoryGoodsDetailByGoodsId(Long goodsId) {
        if (getMapper().deleteCategoryDetailByGoodsId(goodsId) > 0) {
            return Result.ok();
        }
        return Result.err("删除物资分类关联关系失败");
    }
}
