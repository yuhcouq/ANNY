package com.vienmv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vienmv.model.Product;
import com.vienmv.service.ProductService;
import com.vienmv.service.impl.ProductServiceImpl;
import com.vienmv.util.Constant;
@WebServlet(urlPatterns="/product/category")
public class ProductSeachByCategory extends HttpServlet {
	ProductService productService=new ProductServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate_id = req.getParameter("cate_id");
		int page = Integer.parseInt(req.getParameter("page"));
		int totalResult =  productService.countByCategory(Integer.parseInt(cate_id));
		List<Product> productSeachByCategory = productService.seachByCategory(Integer.parseInt(cate_id), page);
		req.setAttribute("productSeachByCategory", productSeachByCategory);
		req.setAttribute("page", page);
		req.setAttribute("cate_id", cate_id);
		req.setAttribute("totalResult", (totalResult/Integer.parseInt(Constant.LIMIT)) + 1);
		req.getRequestDispatcher("/view/client/view/productSeachByCategory.jsp").forward(req, resp);
	}
}
