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
    public List<Product> queryProductByPclass(String pclass) {
        return productMapper.queryProductByPclass(pclass);
    }

    @Override
    public List<Product> queryProductByPname(String pname) {
        return productMapper.queryProductByPname(pname);
    }

    @Override
    public Product queryProductByPid(int pid) {
        return productMapper.queryProductByPid(pid);
    }

    @Override
    public int addProductStock(int pid, int count) {
        return productMapper.addProductStock(pid, count);
    }

    @Override
    public int reduceProductStock(int pid, int count) {
        return productMapper.reduceProductStock(pid, count);
    }

}
