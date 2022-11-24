package com.mall.service;

import com.mall.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderService {

    int addOrder(Map<String, Object> map);

    int addOrderProduct(Map<String, Object> map);

    List<Order> queryOrderByUid(String uid);

    Order queryOrderByOid(String uid, String oid);

    List<Order> queryOrderByOstatus(String uid, String ostatus);

    int updateOrderByOstatus(String ostatus, String oid);

    int deleteOrderByOid(String oid);
}
