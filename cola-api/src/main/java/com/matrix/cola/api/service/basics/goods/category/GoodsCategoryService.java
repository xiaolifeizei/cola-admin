package com.matrix.cola.api.service.basics.goods.category;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.common.service.BaseColaEntityService;
import com.matrix.cola.api.entity.basics.goods.category.GoodsCategoryEntity;

/**
 * 物资分类服务接口
 *
 * @author : cui_feng
 * @since : 2022-06-24 10:05
 */
public interface GoodsCategoryService extends BaseColaEntityService<GoodsCategoryEntity> {

    /**
     * 查询物资分类树
     * @param query 查询条件
     * @return 树
     */
    Result getCategoryTree(Query<GoodsCategoryEntity> query);
}
