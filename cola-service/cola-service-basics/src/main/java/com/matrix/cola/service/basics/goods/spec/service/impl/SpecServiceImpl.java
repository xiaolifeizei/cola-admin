package com.matrix.cola.service.basics.goods.spec.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.service.ColaCacheName;
import com.matrix.cola.api.entity.basics.goods.spec.SpecEntity;
import com.matrix.cola.api.service.basics.goods.goods.GoodsService;
import com.matrix.cola.api.service.basics.goods.spec.SpecService;
import com.matrix.cola.service.basics.goods.spec.mapper.SpecMapper;
import com.matrix.cola.service.common.service.AbstractColaEntityService;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Objects;

/**
 * 规格实体服务实现类
 *
 * @author : cui_feng
 * @Date: 2022-04-13 13:24
 */
@DubboService
public class SpecServiceImpl extends AbstractColaEntityService<SpecEntity, SpecMapper> implements SpecService {

    @Autowired
    GoodsService goodsService;

    @Override
    protected Result validate(SpecEntity po) {
        if (StrUtil.isEmpty(po.getName())) {
            return Result.err("操作失败，规格名称不能为空");
        }

        if (ObjectUtil.isNull(po.getGoodsId())) {
            return Result.err("操作失败，物资不能为空");
        }

        if (ObjectUtil.isNull(goodsService.getOne(po.getGoodsId()))) {
            return Result.err("操作失败，物资不存在或已经被删除");
        }

        LambdaQueryWrapper<SpecEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SpecEntity::getGoodsId,po.getGoodsId()).eq(SpecEntity::getName, po.getName().trim());
        SpecEntity specPO = getOne(queryWrapper);
        if (ObjectUtil.isNotNull(specPO) && !Objects.equals(specPO.getId(),po.getId())) {
            return Result.err("操作失败，该规格已经存在");
        }

        return super.validate(po);
    }

    @Override
    protected Result beforeUpdate(SpecEntity after) {
        // 更新前删除缓存
        cacheProxy.evict(ColaCacheName.GOODS_SPEC,after.getId().toString());
        return Result.ok();
    }
}
