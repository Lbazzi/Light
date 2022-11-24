package com.mall.service;

import com.mall.mapper.CarMapper;
import com.mall.pojo.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    @Qualifier("carMapper")
    private CarMapper carMapper;

    @Override
    public int addCar(Map<String, Object> map) {
        return carMapper.addCar(map);
    }

    @Override
    public int deleteCar(int cid) {
        return carMapper.deleteCar(cid);
    }

    @Override
    public Car queryCarByCid(int cid) {
        return carMapper.queryCarByCid(cid);
    }

    @Override
    public List<Car> queryCarByUid(String uid) {
        return carMapper.queryCarByUid(uid);
    }

    @Override
    public Car queryCarByPidAndUid(int pid, String uid) {
        return carMapper.queryCarByPidAndUid(pid, uid);
    }

    @Override
    public int updateCarByQuantity(int count, int pid, String uid) {
        return carMapper.updateCarByQuantity(count, pid, uid);
    }

}
