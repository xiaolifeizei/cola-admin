package com.matrix.cola.web.domain.basics.customer.controller;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.basics.customer.category.CustomerCategoryEntity;
import com.matrix.cola.api.service.basics.customer.category.CustomerCategoryDetailService;
import com.matrix.cola.api.service.basics.customer.category.CustomerCategoryService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 客户分类Controller
 *
 * @author : cui_feng
 * @since : 2022-06-28 11:59
 */
@RestController
@RequestMapping("/basics/customer/category")
public class CustomerCategoryController {


    @DubboReference
    CustomerCategoryService customerCategoryService;

    @DubboReference
    CustomerCategoryDetailService customerCategoryDetailService;

    @PostMapping("/getCategoryTree")
    public Result getCategoryTree(@RequestBody Query<CustomerCategoryEntity> query) {
        return customerCategoryService.getCategoryTree(query);
    }

    @PostMapping("/getCategoryByCustomerId")
    public Result getCategoryByCustomerId(Long customerId) {
        return customerCategoryDetailService.getCategoryByCustomerId(customerId);
    }

    @PostMapping("/addCategory")
    public Result addCategory(@RequestBody CustomerCategoryEntity customerCategoryPO) {
        return customerCategoryService.insert(customerCategoryPO);
    }

    @PostMapping("/updateCategory")
    public Result updateCategory(@RequestBody CustomerCategoryEntity customerCategoryPO) {
        return customerCategoryService.modify(customerCategoryPO);
    }

    @PostMapping("/deleteCategory")
    public Result deleteCategory(@RequestBody CustomerCategoryEntity customerCategoryPO) {
        return customerCategoryService.remove(customerCategoryPO);
    }
}
