package com.matrix.cola.api.service.basics.customer.customer;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.common.service.BaseColaEntityService;
import com.matrix.cola.api.entity.basics.customer.customer.CustomerEntity;

/**
 * 客户服务接口
 *
 * @author cui_feng
 * @since : 2022-04-20 14:18
 */
public interface CustomerService extends BaseColaEntityService<CustomerEntity> {

    /**
     * 通过客户分类查询客户分页数据
     * @param query 查询条件
     * @return 分页列表
     */
    Result getCategoryCustomerPage(Query<CustomerEntity> query);
}
