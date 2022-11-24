package com.mall.service;

import com.mall.pojo.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {

    List<Product> queryAllProduct(Map<String, Object> map);

    int addProduct(Product product);

    int deleteProduct(int pid);

    Product queryProductByPid(int pid);

    int updateProduct(Product product);
}
