package com.mall.comtroller;

import com.mall.pojo.Car;
import com.mall.pojo.User;
import com.mall.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class CarController {

    @Autowired
    @Qualifier("carServiceImpl")
    private CarService carService;

    //查找某个用户的购物车
    @RequestMapping("/carList")
    public String queryAllCars(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        List<Car> cars = carService.queryCarByUid(user.getUid());
        model.addAttribute("cars", cars);
        return "carTable";
    }

    //添加商品到某个用户的购物车
    @RequestMapping("/addCar")
    public String addCar(HttpServletRequest request, int pid, int count, int url) {
        User user = (User) request.getSession().getAttribute("user");
        HashMap<String, Object> map = new HashMap<>();
        map.put("quantity", count);
        map.put("pid", pid);
        map.put("uid", user.getUid());
        //查看商品在其用户的购物车中是否存在，若存在：改变数量；若不存在：添加购物车记录
        Car c = carService.queryCarByPidAndUid(pid, user.getUid());
        if (c == null) {
            carService.addCar(map);
        } else {
            carService.updateCarByQuantity(count, pid, user.getUid());
        }
        if (url == 1) { // 返回购物车列表
            return "redirect:/carList";
        } else {
            return "redirect:/index.jsp";
        }
    }

    //更改商品在购物车内的数量
    @RequestMapping("/updateCarByQuantity")
    public String updateCarByQuantity(int count, int pid, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        carService.updateCarByQuantity(count, pid, user.getUid());
        return "redirect:/carList";
    }

    //删除购物车记录
    @RequestMapping("deleteCar")
    public String deleteCar(int cid) {
        carService.deleteCar(cid);
        return "redirect:/carList";
    }

    //删除选中的购物车记录
    @RequestMapping("/deleteSelectedCar")
    public String deleteSelectedCar(HttpServletRequest request) {
        String[] cids = request.getParameterValues("cids");
        System.out.println(cids.length);

        if (cids.length != 0) {
            for (String cid : cids) {
                carService.deleteCar(Integer.parseInt(cid));
            }
        }
        return "redirect:/carList";
    }

    //点击结算按钮后，添加购物车记录到订单表，并转到结算界面
    @RequestMapping("/toOrder")
    public String toOrder(HttpServletRequest request, Model model) {
        String cids = request.getParameter("cids");
        String[] split = cids.split(",");
        List<Car> list = new ArrayList<>();
        for (String s : split) {
            Car car = carService.queryCarByCid(Integer.parseInt(s));
            list.add(car);
        }
        model.addAttribute("cids", cids);
        model.addAttribute("list", list);
        return "carTable2";
    }

}