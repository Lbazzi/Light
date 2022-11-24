package com.mall.controller;

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
import java.util.HashMap;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @RequestMapping("/checkUid")
    @ResponseBody
    public String checkUid(String uid) {
        String msg = "";
        User user = userService.queryUserByUid(uid);
        if (user == null || user.getUstatus().equals("0")) {
            msg = "用户名不存在";
        } else {
            msg = "ok";
        }
        return msg;
    }

    @RequestMapping("/checkUpassword")
    @ResponseBody
    public String checkUpassword(String uid, String upassword) {
        String msg = "";
        User user = userService.queryUserByUid(uid);
        if (user.getUpassword().equals(upassword)) {
            msg = "ok";
        } else {
            msg = "密码错误";
        }
        return msg;
    }

    @RequestMapping("/login")
    public String login(String uid, HttpServletRequest request) {
        User user = userService.queryUserByUid(uid);
        request.getSession().setAttribute("admin", user);
        return "index";
    }

    @RequestMapping("/signOut")
    public String signOut(HttpServletRequest request) {
        request.getSession().removeAttribute("admin");
        return "login";
    }

    @RequestMapping("/userList")
    public String queryAll(Model model, @RequestParam(required = false, defaultValue = "1") Integer startPage, @RequestParam(required = false, defaultValue = "10") Integer pageSize, HttpServletRequest request) {

        String uid = request.getParameter("uid");
        String name = request.getParameter("uname");
        String phone = request.getParameter("uphone");
        HashMap<String, Object> map = new HashMap<>();
        map.put("uid", uid);
        map.put("uname", name);
        map.put("uphone", phone);

        PageHelper.startPage(startPage, pageSize);
        List<User> users = userService.queryAllUser(map);

        PageInfo<User> pageInfo = new PageInfo<>(users);
        model.addAttribute("pageInfo", pageInfo);
        return "user";
    }

    //通过用户id查找用户
    @RequestMapping("/queryUserByUid")
    public String queryUserByUid(Model model, String uid) {
        User user = userService.queryUserByUid(uid);
        model.addAttribute("admin", user);
        return "userModify";
    }

    @RequestMapping("/addUser")
    public String add(User user) {
        userService.addUser(user);
        return "redirect:/userList";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(String uid) {
        userService.deleteUser(uid);
        return "redirect:/userList";
    }

    @RequestMapping("/deleteSelectedUser")
    public String deleteSelectedUser(HttpServletRequest request) {
        String[] uids = request.getParameterValues("uids");
        for (String uid : uids) {
            userService.deleteUser(uid);
        }
        return "redirect:/userList";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user) {
        userService.updateUser(user);
        return "redirect:/userList";
    }

    @RequestMapping("/updateUserByPassword")
    public String updateUserByPassword(HttpServletRequest request, String newPassword) {
        User user = (User) request.getSession().getAttribute("admin");
        userService.updateUserByPassword(user.getUid(), newPassword);
        return "index";
    }

    @RequestMapping("/checkTwoPassword")
    @ResponseBody
    public String checkTwoPassword(HttpServletRequest request, String password) {
        String msg = "";
        User user = (User) request.getSession().getAttribute("admin");
        User u = userService.queryUserByUid(user.getUid());
        if (!password.equals(u.getUpassword())) {
            msg = "ok";
        } else {
            msg = "新密码与原密码不得一致";
        }
        return msg;
    }

    @RequestMapping("/queryUserPassword")
    @ResponseBody
    public String queryUserPassword(HttpServletRequest request, String password) {
        String msg = "";
        User user = (User) request.getSession().getAttribute("admin");
        User u = userService.queryUserByUid(user.getUid());
        if (password.equals(u.getUpassword())) {
            msg = "ok";
        } else {
            msg = "密码错误";
        }
        return msg;
    }
}
