package com.matrix.cola.api.service.basics.customer.category;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.service.BaseEntityService;
import com.matrix.cola.api.entity.basics.customer.category.CustomerCategoryDetailEntity;

/**
 * 客户分类关联关系服务接口
 *
 * @author : cui_feng
 * @since : 2022-06-28 10:51
 */
public interface CustomerCategoryDetailService extends BaseEntityService<CustomerCategoryDetailEntity> {

    /**
     * 通过客户Id查询客户分类
     * @param customerId 客户Id
     * @return 客户分类
     */
    Result getCategoryByCustomerId(Long customerId);

    /**
     * 通过客户Id 物理删除客户分类关联关系
     * @param customerId 客户Id
     * @return 结果
     */
    Result deleteCategoryCustomerDetailByCustomerId(Long customerId);
}
