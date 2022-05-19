package com.xzh.service;

import com.xzh.service.controller.OrderController;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ServiceApplication.class)
class ServiceApplicationTests {

    @Autowired
    private OrderController orderController;

    @Test
    void contextLoads() {

    }

}
