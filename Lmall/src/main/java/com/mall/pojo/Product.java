package com.mall.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    private int pid;
    private String pname;
    private String pdes;
    private double price;
    private int stock;
    private String pclass;
    private String picture;
    private MultipartFile file;

}
