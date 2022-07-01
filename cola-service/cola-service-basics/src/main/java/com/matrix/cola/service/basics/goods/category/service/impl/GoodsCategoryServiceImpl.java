package com.matrix.cola.service.basics.goods.category.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.common.service.ColaCacheName;
import com.matrix.cola.api.entity.basics.goods.category.GoodsCategoryDetailEntity;
import com.matrix.cola.api.entity.basics.goods.category.GoodsCategoryEntity;
import com.matrix.cola.api.entity.basics.goods.category.GoodsCategoryTree;
import com.matrix.cola.api.service.basics.goods.category.GoodsCategoryDetailService;
import com.matrix.cola.api.service.basics.goods.category.GoodsCategoryService;
import com.matrix.cola.service.basics.goods.category.mapper.CategoryMapper;
import com.matrix.cola.service.common.service.AbstractColaEntityService;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

import java.util.Objects;

/**
 * 物资分类服务接口实现类
 *
 * @author : cui_feng
 * @since : 2022-06-24 10:13
 */
@DubboService
public class GoodsCategoryServiceImpl extends AbstractColaEntityService<GoodsCategoryEntity, CategoryMapper> implements GoodsCategoryService {

    @Autowired
    @Lazy
    GoodsCategoryDetailService goodsCategoryDetailService;

    @Override
    public Result getCategoryTree(Query<GoodsCategoryEntity> query) {
        return Result.list(GoodsCategoryTree.getCategoryTree(getList(query)));
    }

    @Override
    protected Result validate(GoodsCategoryEntity po) {

        if (StrUtil.isEmpty(po.getName())) {
            return Result.err("操作失败，物资分类名称不能为空");
        }

        if (StrUtil.isEmpty(po.getCode())) {
            return Result.err("操作失败，物资分类编码不能为空");
        }

        if (ObjectUtil.isNull(po.getParentId())) {
            return Result.err("操作失败，父节点不能为空");
        }

        LambdaQueryWrapper<GoodsCategoryEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(GoodsCategoryEntity::getName,po.getName());
        GoodsCategoryEntity goodsCategoryPO = getOne(queryWrapper);
        if (ObjectUtil.isNotNull(goodsCategoryPO) && !Objects.equals(po.getId(), goodsCategoryPO.getId())) {
            return Result.err("操作失败，物资分类名称已存在");
        }

        queryWrapper.clear();
        queryWrapper.eq(GoodsCategoryEntity::getCode,po.getCode());
        goodsCategoryPO = getOne(queryWrapper);
        if (ObjectUtil.isNotNull(goodsCategoryPO) && !Objects.equals(po.getId(), goodsCategoryPO.getId())) {
            return Result.err("操作失败，物资分类编码已存在");
        }

        if (!Objects.equals(0L,po.getParentId())) {
            queryWrapper.clear();
            if (ObjectUtil.isNull(getOne(po.getParentId()))) {
                return Result.err("操作失败，父节点不存在或已被删除");
            }
        }

        return super.validate(po);
    }

    @Override
    protected Result afterUpdate(GoodsCategoryEntity po) {
        cacheProxy.evict(ColaCacheName.GOODS_CATEGORY,po.getId().toString());
        return super.afterUpdate(po);
    }

    @Override
    protected Result beforeDelete(GoodsCategoryEntity entity) {
        if (ObjectUtil.isNull(entity) || ObjectUtil.isNull(entity.getId())) {
            return Result.err("删除失败，id不能为空");
        }
        LambdaQueryWrapper<GoodsCategoryEntity> categoryWrapper = new LambdaQueryWrapper<>();
        categoryWrapper.eq(GoodsCategoryEntity::getParentId, entity.getId());
        if (ObjectUtil.isNotEmpty(getList(categoryWrapper))) {
            return Result.err("删除失败，该分类含有子分类，不能删除");
        }

        LambdaQueryWrapper<GoodsCategoryDetailEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(GoodsCategoryDetailEntity::getCategoryId,entity.getId());
        if (ObjectUtil.isNotEmpty(goodsCategoryDetailService.getList(queryWrapper))) {
            return Result.err("删除失败，该分类下还有物资，不能删除");
        }
        cacheProxy.evict(ColaCacheName.GOODS_CATEGORY,entity.getId().toString());
        return super.beforeDelete(entity);
    }
}
