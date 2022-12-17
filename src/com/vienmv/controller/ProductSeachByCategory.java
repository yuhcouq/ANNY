package com.vienmv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vienmv.model.Product;
import com.vienmv.service.CategoryService;
import com.vienmv.service.ProductService;
import com.vienmv.service.impl.CategoryServiceImpl;
import com.vienmv.service.impl.ProductServiceImpl;
import com.vienmv.util.Constant;
@WebServlet(urlPatterns="/product/category")
public class ProductSeachByCategory extends HttpServlet {
	ProductService productService=new ProductServiceImpl();
	CategoryService categoryService=new CategoryServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate_id = req.getParameter("cate_id");
		String cate_id_q = cate_id;
		int page = Integer.parseInt(req.getParameter("page"));
		String categoryName = "";
		if("A".equals(cate_id)) {
			cate_id_q = "(1, 4, 7)";
			categoryName = "MEN";
		} else if("B".equals(cate_id)) {
			cate_id_q = "(2, 5, 8, 10)";
			categoryName = "WOMEN";
		} else if("C".equals(cate_id)) {
			cate_id_q = "(3, 5, 9)";
			categoryName = "CHILDREN";
		} else {
			cate_id_q = "(" + cate_id_q + ")";
			categoryName = categoryService.get(Integer.parseInt(cate_id)).getName();
		}
		
		int totalResult =  productService.countByCategory(cate_id_q);
		List<Product> productSeachByCategory = productService.seachByCategory(cate_id_q, page);
		req.setAttribute("productSeachByCategory", productSeachByCategory);
		req.setAttribute("page", page);
		req.setAttribute("cate_id", cate_id);
		req.setAttribute("cate_name", categoryName);
		int totalPage = totalResult/Integer.parseInt(Constant.LIMIT);
		if(totalResult % Integer.parseInt(Constant.LIMIT) > 0) {
			totalPage = totalPage + 1;
		}
		req.setAttribute("totalResult", totalPage);
		req.getRequestDispatcher("/view/client/view/productSeachByCategory.jsp").forward(req, resp);
	}
}
