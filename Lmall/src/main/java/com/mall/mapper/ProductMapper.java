package com.mall.mapper;

import com.mall.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProductMapper {

    List<Product> queryProductByPclass(@Param("pclass") String pclass);

    List<Product> queryProductByPname(@Param("pname") String pname);

    //通过商品id查找商品
    Product queryProductByPid(@Param("pid") int pid);

    int addProductStock(@Param("pid") int pid, @Param("count") int count);

    int reduceProductStock(@Param("pid") int pid, @Param("count") int count);
}
