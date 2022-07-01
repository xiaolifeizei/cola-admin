package com.matrix.cola.api.service.basics.customer.category;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.common.service.BaseColaEntityService;
import com.matrix.cola.api.entity.basics.customer.category.CustomerCategoryEntity;

/**
 * 客户分类实体类服务接口
 *
 * @author : cui_feng
 * @since : 2022-06-28 10:49
 */
public interface CustomerCategoryService extends BaseColaEntityService<CustomerCategoryEntity> {

    /**
     * 获取客户分类树
     * @param query 查询条件
     * @return 结果
     */
    Result getCategoryTree(Query<CustomerCategoryEntity> query);
}
