package com.mall.controller;

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

    @RequestMapping("/productList")
    public String queryAll(Model model, @RequestParam(required = false, defaultValue = "1") Integer startPage, @RequestParam(required = false, defaultValue = "5") Integer pageSize, HttpServletRequest request) {

        String pname = request.getParameter("pname");
        String pclass = request.getParameter("pclass");

        HashMap<String, Object> map = new HashMap<>();

        map.put("pname", pname);
        map.put("pclass", pclass);

        PageHelper.startPage(startPage, pageSize);
        List<Product> products = productService.queryAllProduct(map);

        PageInfo<Product> pageInfo = new PageInfo<>(products);
        model.addAttribute("pageInfo", pageInfo);

        return "product";
    }

    @RequestMapping("/queryProductByPid")
    public String queryProductByPid(Model model, int pid) {
        Product product = productService.queryProductByPid(pid);
        model.addAttribute("product", product);
        return "productModify";
    }

    @RequestMapping("/deleteProduct")
    public String deleteProduct(int pid) {
        productService.deleteProduct(pid);
        return "redirect:/productList";
    }

    @RequestMapping("/deleteSelectedProduct")
    public String deleteSelectedProduct(HttpServletRequest request) {
        String[] pids = request.getParameterValues("pids");
        for (String pid : pids) {
            productService.deleteProduct(Integer.parseInt(pid));
        }
        return "redirect:/productList";
    }

    @RequestMapping("/updateProduct")
    public String updateProduct(Product product) throws IOException {
        String path1 = "L:\\Light\\admin\\web\\statics\\img\\product";
        String path2 = "L:\\Light\\Lmall\\web\\statics\\img\\product";

        MultipartFile file1 = product.getFile();
        MultipartFile file2 = product.getFile();
        String fileName1 = file1.getOriginalFilename();
        String fileName2 = file2.getOriginalFilename();

        File targetFile1 = null;
        File targetFile2 = null;

        if (!"".equals(fileName1) && fileName1 != null) {
            targetFile1 = new File(path1, fileName1);
            if (!targetFile1.exists()) {
                targetFile1.mkdirs();
            }
            file1.transferTo(targetFile1);
            product.setPicture(fileName1);
        }

        if (!"".equals(fileName2) && fileName2 != null) {
            targetFile2 = new File(path2, fileName2);
            if (!targetFile2.exists()) {
                targetFile2.mkdirs();
            }
            file1.transferTo(targetFile2);
        }

        productService.updateProduct(product);
        return "redirect:/productList";
    }

    @RequestMapping("/addProduct")
    public String addProduct(Product product) throws IOException {
        String path1 = "L:\\Light\\Lmall\\web\\statics\\img\\product"; // 上传后的地址
        String path2 = "L:\\Light\\admin\\web\\statics\\img\\product";

        MultipartFile file = product.getFile();
        String fileName = file.getOriginalFilename(); // 获取文件名

        File targetFile1 = null;
        File targetFile2 = null;

        System.out.println("filename = " + fileName);

        if (fileName != null && !fileName.equals("")) {
            targetFile1 = new File(path1, fileName);
            targetFile2 = new File(path2, fileName);

            if (!targetFile1.exists()) { //判断目标文件夹是否存在，进行创建
                targetFile1.mkdirs();
            }
            if (!targetFile2.exists()) { //判断目标文件夹是否存在，进行创建
                targetFile2.mkdirs();
            }

            file.transferTo(targetFile1); //文件传输到目标位置
            file.transferTo(targetFile2);
        }

        product.setPicture(fileName);
        productService.addProduct(product);
        return "redirect:productList";
    }
}
