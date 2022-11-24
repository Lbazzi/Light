package com.mall.service;

import com.mall.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProductService {

    List<Product> queryProductByPclass(String pclass);

    List<Product> queryProductByPname(String pname);

    Product queryProductByPid(int pid);

    int addProductStock(int pid, int count);

    int reduceProductStock(int pid, int count);
}
