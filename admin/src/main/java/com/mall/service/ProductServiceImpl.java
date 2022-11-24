package com.mall.service;

import com.mall.mapper.ProductMapper;
import com.mall.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    @Qualifier("productMapper")
    private ProductMapper productMapper;


    @Override
    public List<Product> queryAllProduct(Map<String, Object> map) {
        return productMapper.queryAllProduct(map);
    }

    @Override
    public int addProduct(Product product) {
        return productMapper.addProduct(product);
    }

    @Override
    public int deleteProduct(int pid) {
        return productMapper.deleteProduct(pid);
    }

    @Override
    public Product queryProductByPid(int pid) {
        return productMapper.queryProductByPid(pid);
    }

    @Override
    public int updateProduct(Product product) {
        return productMapper.updateProduct(product);
    }
}
