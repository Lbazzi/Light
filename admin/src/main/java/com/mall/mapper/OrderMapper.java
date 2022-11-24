package com.mall.mapper;

import com.mall.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface OrderMapper {

    List<Order> queryAllOrder(HashMap<String, Object> map);

    List<Order> queryOrderByUid(@Param("uid") String uid);

    Order queryOrderByOid(@Param("oid") String oid);

    int updateOrderByOstatus(@Param("ostatus") String ostatus, @Param("oid") String oid);

}
