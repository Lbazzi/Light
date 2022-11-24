package com.mall.service;

import com.mall.pojo.Car;

import java.util.List;
import java.util.Map;

public interface CarService {


    int addCar(Map<String, Object> map);

    int deleteCar(int cid);

    Car queryCarByCid(int cid);

    List<Car> queryCarByUid(String uid);

    Car queryCarByPidAndUid(int pid, String uid);

    int updateCarByQuantity(int count, int pid, String uid);

}
