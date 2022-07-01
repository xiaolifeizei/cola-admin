package com.matrix.cola.web.domain.basics.customer.controller;

import com.matrix.cola.api.Result;
import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.basics.customer.customer.CustomerEntity;
import com.matrix.cola.api.service.basics.customer.customer.CustomerService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 客户管理controller
 *
 * @author : cui_feng
 * @since : 2022-06-28 11:59
 */
@RestController
@RequestMapping("/basics/customer")
public class CustomerController {

    @DubboReference
    CustomerService customerService;

    @PostMapping("/getCategoryCustomerPage")
    public Result getCategoryGoodsPage(@RequestBody Query<CustomerEntity> query) {
        return customerService.getCategoryCustomerPage(query);
    }

    @PostMapping("/addCustomer")
    public Result addCustomer(@RequestBody CustomerEntity customerPO) {
        return customerService.insert(customerPO);
    }

    @PostMapping("/updateCustomer")
    public Result updateCustomer(@RequestBody CustomerEntity customerPO) {
        return customerService.modify(customerPO);
    }

    @PostMapping("/deleteCustomer")
    public Result deleteCustomer(@RequestBody CustomerEntity customerPO) {
        return customerService.remove(customerPO);
    }
}
