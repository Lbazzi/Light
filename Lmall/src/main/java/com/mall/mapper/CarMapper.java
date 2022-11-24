package com.mall.mapper;

import com.mall.pojo.Car;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CarMapper {

    int addCar(Map<String, Object> map);

    int deleteCar(@Param("cid") int cid);

    //查找：cid
    Car queryCarByCid(@Param("cid") int cid);

    //查找：uid
    List<Car> queryCarByUid(@Param("uid") String uid);

    //查找：用户是否有某个商品
    Car queryCarByPidAndUid(@Param("pid") int pid, @Param("uid") String uid);

    //更改：数量
    int updateCarByQuantity(@Param("count") int count, @Param("pid") int pid, @Param("uid") String uid);
}
