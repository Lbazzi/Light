package com.mall.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.pojo.Order;
import com.mall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    @Qualifier("orderServiceImpl")
    private OrderService orderService;

    @RequestMapping("/orderList")
    public String queryAll(Model model, HttpServletRequest request, @RequestParam(required = false, defaultValue = "1") Integer startPage, @RequestParam(required = false, defaultValue = "5") Integer pageSize) {
        String oid = request.getParameter("oid");
        String status = request.getParameter("status");
        String uname = request.getParameter("uname");
        String ostatus = null;
        System.out.println("oid = " + oid);
        System.out.println("status = " + status);
        System.out.println("uname = " + uname);

        if (status != null) {
            if (status.equals("未付款")) {
                ostatus = "0";
            } else if (status.equals("未发货")) {
                ostatus = "1";
            }  else if (status.equals("未收货")) {
                ostatus = "2";
            } else if (status.equals("已收货")) {
                ostatus = "3";
            }
        }

        System.out.println("ostatus = " + ostatus);

        HashMap<String, Object> map = new HashMap<>();
        map.put("oid", oid);
        map.put("ostatus", ostatus);
        map.put("uname", uname);

        System.out.println(map);

        PageHelper.startPage(startPage, pageSize);
        List<Order> orders = orderService.queryAllOrder(map);
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        model.addAttribute("pageInfo", pageInfo);
        return "order";
    }

    @RequestMapping("/queryOrderByOid")
    public String queryOrderByOid(String oid, Model model) {
        Order order = orderService.queryOrderByOid(oid);
        model.addAttribute("orderDetail", order);
        return "orderDetail";
    }

    @RequestMapping("/updateOrderByOstatus")
    public String updateOrderByOstatus(String ostatus, String oid) {
        orderService.updateOrderByOstatus(ostatus, oid);
        return "redirect:orderList";
    }

}
