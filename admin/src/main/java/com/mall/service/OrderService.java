package com.mall.service;

import com.mall.pojo.Order;

import java.util.HashMap;
import java.util.List;

public interface OrderService {

    List<Order> queryAllOrder(HashMap<String, Object> map);

    List<Order> queryOrderByUid(String uid);

    Order queryOrderByOid(String oid);

    int updateOrderByOstatus(String ostatus, String oid);
}
