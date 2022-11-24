package com.mall.service;

import com.mall.mapper.OrderMapper;
import com.mall.pojo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    @Qualifier("orderMapper")
    private OrderMapper orderMapper;

    @Override
    public int addOrder(Map<String, Object> map) {
        return orderMapper.addOrder(map);
    }

    @Override
    public int addOrderProduct(Map<String, Object> map) {
        return orderMapper.addOrderProduct(map);
    }

    @Override
    public List<Order> queryOrderByUid(String uid) {
        return orderMapper.queryOrderByUid(uid);
    }

    @Override
    public Order queryOrderByOid(String uid, String oid) {
        return orderMapper.queryOrderByOid(uid, oid);
    }

    @Override
    public List<Order> queryOrderByOstatus(String uid, String ostatus) {
        return orderMapper.queryOrderByOstatus(uid, ostatus);
    }

    @Override
    public int updateOrderByOstatus(String ostatus, String oid) {
        return orderMapper.updateOrderByOstatus(ostatus, oid);
    }

    @Override
    public int deleteOrderByOid(String oid) {
        return orderMapper.deleteOrderByOid(oid);
    }


}
