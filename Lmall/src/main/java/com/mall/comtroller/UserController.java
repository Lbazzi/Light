package com.mall.comtroller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.pojo.User;
import com.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    //通过手机号登录后，跳转到首页
    @RequestMapping("/login")
    public String login(String uphone, HttpServletRequest request) {
        request.getSession().setAttribute("user", userService.queryUserByUphone(uphone));
        return "index";
    }

    //修改用户信息，并跳转到主页
    @RequestMapping("/updateUser")
    public String updateUser(User user, HttpServletRequest request) {
        userService.updateUser(user);
        request.getSession().setAttribute("user", user);
        return "personal";
    }

    //修改用户密码
    @RequestMapping("/updateUserByPassword")
    public String updateUserByPassword(HttpServletRequest request, String newPassword) {
        User user = (User) request.getSession().getAttribute("user");
        userService.updateUserByPassword(user.getUid(), newPassword);
        return "personal";
    }

    //查找用户的密码
    @RequestMapping("/queryUserPassword")
    @ResponseBody
    public String queryUserPassword(HttpServletRequest request, String password) {
        String msg = "";
        User user = (User) request.getSession().getAttribute("user");
        User u = userService.queryUserByUid(user.getUid());
        if (password.equals(u.getUpassword())) {
            msg = "ok";
        } else {
            msg = "密码错误";
        }
        return msg;
    }

    //检查注册时，输入的两次密码是否一致
    @RequestMapping("/checkTwoPassword")
    @ResponseBody
    public String checkTwoPassword(HttpServletRequest request, String password) {
        String msg = "";
        User user = (User) request.getSession().getAttribute("user");
        User u = userService.queryUserByUid(user.getUid());
        if (!password.equals(u.getUpassword())) {
            msg = "ok";
        } else {
            msg = "新密码与原密码不得一致";
        }
        return msg;
    }

    //查看用户名是否存在
    @RequestMapping("/queryUserByUphone")
    @ResponseBody
    public String queryUserByUphone(String uphone) {
        String msg = "";
        User user = userService.queryUserByUphone(uphone);
        if (user == null) {
            msg = "用户名不存在";
        } else {
            msg = "ok";
        }
        return msg;
    }

    //查看用户名与密码是否正确
    @RequestMapping("/checkUpassword")
    @ResponseBody
    public String checkUpassword(String uphone, String upassword) {
        String msg = "";
        User user = userService.queryUserByUphone(uphone);
        if (user.getUpassword().equals(upassword)) {
            msg = "ok";
        } else {
            msg = "密码错误";
        }
        return msg;
    }


    //注册用户,成功后返回登录界面
    @RequestMapping("/signUp")
    public String signUp(User user) {
        userService.addUser(user);
        return "login";
    }

    //退出登录
    @RequestMapping("/signOut")
    public String signOut(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "index";
    }

}
