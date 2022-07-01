package com.matrix.cola.service.order;

import com.matrix.cola.api.common.entity.Query;
import com.matrix.cola.api.entity.basics.customer.customer.CustomerEntity;
import com.matrix.cola.api.service.basics.customer.customer.CustomerService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author : cui_feng
 * @since : 2022-06-02 21:10
 */

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ServiceOrderApplication.class)
public class TestDubbo {

    @DubboReference
    CustomerService customerService;

    @Test
    public void test(){
        Query<CustomerEntity> query = new Query<>();
        query.eq("name","aaaa98","or").like("name","bb");
        System.out.println(customerService.getList(query));
    }
}
