package com.mall.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    private String oid;
    private double oprice;
    private String otime;
    private String ostatus;
    private User user;
    private List<OrderProduct> orderProducts;

}
