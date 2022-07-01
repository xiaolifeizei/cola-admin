package com.matrix.cola.service.basics.goods.spec.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.matrix.cola.api.common.service.ColaCacheName;
import com.matrix.cola.api.entity.basics.goods.goods.GoodsEntity;
import com.matrix.cola.api.entity.basics.goods.spec.SpecEntity;
import com.matrix.cola.api.entity.basics.goods.spec.SpecEntityWrapper;
import com.matrix.cola.api.service.basics.goods.goods.GoodsService;
import com.matrix.cola.api.service.basics.goods.spec.SpecService;
import com.matrix.cola.api.service.basics.goods.spec.SpecWrapperService;
import com.matrix.cola.service.common.service.AbstractColaEntityWrapperService;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 规格包装类接口实现类
 *
 * @author : cui_feng
 * @since : 2022-06-21 12:21
 */
@DubboService
public class SpecWrapperServiceImpl extends AbstractColaEntityWrapperService<SpecEntity, SpecEntityWrapper, SpecService> implements SpecWrapperService {

    @Autowired
    GoodsService goodsService;

    @Override
    public SpecEntityWrapper entityWrapper(SpecEntity entity) {
        SpecEntityWrapper specEntityWrapper = new SpecEntityWrapper();
        if (ObjectUtil.isNotNull(entity.getGoodsId())) {
            GoodsEntity goodsPO = cacheProxy.getObjectFromLoader(ColaCacheName.GOODS,entity.getGoodsId().toString(), () -> {
                return goodsService.getOne(entity.getGoodsId());
            });
            if (ObjectUtil.isNotNull(goodsPO)) {
                specEntityWrapper.setGoodsName(goodsPO.getName());
            }
        }
        return specEntityWrapper;
    }
}
