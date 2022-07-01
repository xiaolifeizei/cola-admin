package com.matrix.cola.api.service.basics.goods.goods;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.common.service.BaseColaEntityService;
import com.matrix.cola.api.entity.basics.goods.goods.GoodsEntity;

/**
 * 物资实体服务接口类
 *
 * @author cui_feng
 * @since : 2022-04-20 14:18
 */
public interface GoodsService extends BaseColaEntityService<GoodsEntity> {

    /**
     * 通过物资分类查询物资分页数据
     * @param query 查询条件
     * @return 物资分页列表
     */
    Result getCategoryGoodsPage(Query<GoodsEntity> query);
}
