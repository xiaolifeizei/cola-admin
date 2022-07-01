package com.matrix.cola.service.basics;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.matrix.cola.api.entity.basics.customer.customer.CustomerEntity;
import com.matrix.cola.api.service.basics.customer.customer.CustomerService;
import com.matrix.cola.api.service.serialno.SerialNoService;
import com.matrix.cola.service.ServiceBasicsApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;


/**
 * 测试类
 *
 * @Author : cui_feng
 * @Date: 2022-04-07 11:58
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = ServiceBasicsApplication.class)
public class TestApplication {


    @Autowired(required = false)
    private CustomerService customerService;

    @Autowired
    private SerialNoService serialnoService;

    @Test
    public void addCustomer() {

        for (int i=0; i<100; i++) {
            CustomerEntity customerPO = new CustomerEntity();
            customerPO.setName("aaaa"+ i);
            customerPO.setSpellCode("bbbb"+ i);
            customerService.add(customerPO);
        }
    }

    @Test
    public void updateCustomer() {
        CustomerEntity customerPO = new CustomerEntity();
        customerPO.setId(7L);
        customerPO.setName("测试一下");
        customerService.update(customerPO);
    }

    @Test
    public void deleteCustomer() {
         CustomerEntity customerPO = new CustomerEntity();
         customerPO.setId(7L);
        // customerService.delete(customerPO);
    }

    @Test
    public void testService() {
        CustomerEntity customerPO = new CustomerEntity();
        customerPO.setId(8L);
        customerPO = customerService.getOne(customerPO);

        System.out.println("=============================");
        System.out.println(customerPO);

        customerPO = customerService.getOne(9L);

        System.out.println("=============================");
        System.out.println(customerPO);

        QueryWrapper<CustomerEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name","aaaa10");

        System.out.println("=============================");
        System.out.println(customerPO);

        queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name","2");
        List<CustomerEntity> list = customerService.getList(queryWrapper);
        System.out.println("=============================");
        System.out.println(list);

    }

    @Test
    public void testSerialno(){
        while (true) {
            try {
                Thread.sleep(1000);
                String sno = serialnoService.getSerialNo("customer","10001");
                System.out.println(sno);
            } catch (Exception e) {

            }
        }


    }
}
