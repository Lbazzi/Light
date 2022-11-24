package com.mall.mapper;

import com.mall.pojo.Order;
import org.apache.ibatis.annotations.Param;
import org.aspectj.weaver.ast.Or;

import java.util.List;
import java.util.Map;

public interface OrderMapper {

    int addOrder(Map<String, Object> map);

    int addOrderProduct(Map<String, Object> map);

    List<Order> queryOrderByUid(@Param("uid") String uid);

    Order queryOrderByOid(@Param("uid") String uid, @Param("oid") String oid);

    List<Order> queryOrderByOstatus(@Param("uid") String uid, @Param("ostatus") String ostatus);

    int updateOrderByOstatus(@Param("ostatus") String ostatus, @Param("oid") String oid);

    int deleteOrderByOid(@Param("oid") String oid);
}
