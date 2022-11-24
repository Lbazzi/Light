package com.mall.service;

import com.mall.mapper.OrderMapper;
import com.mall.pojo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    @Qualifier("orderMapper")
    private OrderMapper orderMapper;


    @Override
    public List<Order> queryAllOrder(HashMap<String, Object> map) {
        return orderMapper.queryAllOrder(map);
    }

    @Override
    public List<Order> queryOrderByUid(String uid) {
        return orderMapper.queryOrderByUid(uid);
    }

    @Override
    public Order queryOrderByOid(String oid) {
        return orderMapper.queryOrderByOid(oid);
    }

    @Override
    public int updateOrderByOstatus(String ostatus, String oid) {
        return orderMapper.updateOrderByOstatus(ostatus, oid);
    }


}
