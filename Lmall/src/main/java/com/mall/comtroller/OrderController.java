package com.mall.comtroller;

import com.mall.pojo.Car;
import com.mall.pojo.Order;
import com.mall.pojo.OrderProduct;
import com.mall.pojo.User;
import com.mall.service.CarService;
import com.mall.service.OrderService;
import com.mall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class OrderController {

    @Autowired
    @Qualifier("orderServiceImpl")
    private OrderService orderService;

    @Autowired
    @Qualifier("carServiceImpl")
    private CarService carService;

    @Autowired
    @Qualifier("productServiceImpl")
    private ProductService productService;

    //把购物车的东西加入到订单表中
    @RequestMapping("/addOrder")
    public String addOrder(HttpServletRequest request, Model model) {
        String cids = request.getParameter("cids");  //获取到购物表的信息，一个购物车表记录对应一个用户的一件商品的购买数量
        String[] split = cids.split(",");  // 获取到该订单的所有购物车id
        double sum = 0; // 计算该订单的总金额

        //建立一个list存储购物表的信息
        List<Car> list = new ArrayList<>();
        for (String s : split) {
            Car car = carService.queryCarByCid(Integer.parseInt(s));

            productService.reduceProductStock(car.getProduct().getPid(), car.getQuantity()); // 减少商品的库存

            sum += car.getQuantity() * car.getProduct().getPrice();
            list.add(car);
        }

        User user = (User) request.getSession().getAttribute("user");
        //添加订单表
        HashMap<String, Object> map = new HashMap<>();
        String uuid = getUUID();
        map.put("oid", uuid);
        map.put("oprice", sum);
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = sdf.format(date);
        map.put("otime", format);
        map.put("ostatus", "0");
        map.put("uid", user.getUid());
        orderService.addOrder(map);

        //添加订单商品表
        HashMap<String, Object> map1 = new HashMap<>();
        map1.put("oid", uuid);
        for (Car car : list) {
            int pid = car.getProduct().getPid();
            int quantity = car.getQuantity();

            map1.put("quantity", quantity);
            carService.deleteCar(car.getCid());  //删除购物车的记录

            map1.put("pid", pid);
            orderService.addOrderProduct(map1);

        }
        model.addAttribute("oid", uuid);
        //确认订单后，要修改库存量

        return "pay";
    }

    //查找某个用户的订单
    @RequestMapping("/queryOrderByUid")
    public String queryOrderByUid(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = orderService.queryOrderByUid(user.getUid());
        model.addAttribute("list", orders);
        return "myOrder";
    }

    //查看某个订单详情
    @RequestMapping("/queryOrderByOid")
    public String queryOrderByOid(String oid, Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        Order order = orderService.queryOrderByOid(user.getUid(), oid);
        model.addAttribute("orderDeatil", order);
        return "orderDetail";
    }

    //查找某用户的某类订单
    @RequestMapping("/queryOrderByOstatus")
    public String queryOrderByOstatus(String uid, String ostatus, Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        List<Order> orders = orderService.queryOrderByOstatus(user.getUid(), ostatus);
        model.addAttribute("list", orders);
        return "myOrder";
    }

    @RequestMapping("/updateOrderByOstatus")
    public String updateOrderByOstatus(String ostatus, String oid) {
        orderService.updateOrderByOstatus(ostatus, oid);
        return "redirect:/queryOrderByUid";
    }

    @RequestMapping("/topay")
    public String toPay(String oid, Model model, HttpServletRequest request) {
        model.addAttribute("oid", oid);
        return "pay";
    }

    //删除订单，把所有商品的库存返还
    @RequestMapping("/deleteOrderByOid")
    public String deleteOrderByOid(String oid, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");

        Order order = orderService.queryOrderByOid(user.getUid(), oid);

        List<OrderProduct> orderProducts = order.getOrderProducts();
        for (OrderProduct orderProduct : orderProducts) {
            productService.addProductStock(orderProduct.getProduct().getPid(), orderProduct.getQuantity());
        }
        orderService.deleteOrderByOid(oid);
        return "redirect:/queryOrderByUid";
    }

    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
