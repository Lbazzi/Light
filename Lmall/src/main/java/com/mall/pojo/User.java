package com.mall.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    private String uid;
    private String uname;
    private String upassword;
    private String ugender;
    private String uemail;
    private String uphone;
    private String ustatus;
    private String uaddress;

}
