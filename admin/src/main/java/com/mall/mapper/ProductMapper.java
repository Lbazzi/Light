package com.mall.mapper;

import com.mall.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProductMapper {

    List<Product> queryAllProduct(Map<String, Object> map);

    Product queryProductByPid(@Param("pid") int pid);

    int deleteProduct(@Param("pid") int pid);

    int addProduct(Product product);

    int updateProduct(Product product);
}
