package com.vienmv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vienmv.model.CartItem;
import com.vienmv.model.User;
import com.vienmv.service.CartItemService;
import com.vienmv.service.impl.CartServiceItemImpl;

@WebServlet(urlPatterns = "/member/orderList")
public class OrderListClientController extends HttpServlet {
	CartItemService cartItemService = new CartServiceItemImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session= req.getSession();
		if(session != null && session.getAttribute("account") != null) {
			User user = (User) session.getAttribute("account");
			List<CartItem> listCartItem =cartItemService.getAllByUser(user.getId());
			req.setAttribute("listCartItem", listCartItem);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/view/order-list.jsp");
			dispatcher.forward(req, resp);
		} else {
			req.getRequestDispatcher("view/client/view/login.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
