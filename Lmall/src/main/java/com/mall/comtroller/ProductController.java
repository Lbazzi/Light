package com.mall.comtroller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.pojo.Product;
import com.mall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    @Qualifier("productServiceImpl")
    private ProductService productService;

    @RequestMapping("/queryProductByPclass")
    public String queryProductByPclass(Model model, String pclass, @RequestParam(required = false, defaultValue = "1") Integer startPage, @RequestParam(required = false, defaultValue = "12") Integer pageSize) {
        PageHelper.startPage(startPage, pageSize);
        List<Product> products = productService.queryProductByPclass(pclass);
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        model.addAttribute("pclass", pclass);
        model.addAttribute("pageInfo", pageInfo);
        return "productList";
    }

    @RequestMapping("/queryProductByPname")
    public String queryProductByPname(Model model, String pname, @RequestParam(required = false, defaultValue = "1") Integer startPage, @RequestParam(required = false, defaultValue = "12") Integer pageSize) {
        PageHelper.startPage(startPage, pageSize);
        List<Product> products = productService.queryProductByPname(pname);
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        model.addAttribute("pname", pname);
        model.addAttribute("pageInfo", pageInfo);
        return "productList";
    }


    @RequestMapping("/queryProductByPid")
    public String queryProductByPid(Model model, int pid) {
        Product product = productService.queryProductByPid(pid);
        model.addAttribute("product", product);
        return "prodectDetail";
    }

}
