package it.coinstellation.controller;

import java.lang.Integer;

import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public final class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException {
		
		Carrello carrello = request.getSession().getAttribute("cart");
		String action = request.getParameter("action");
		int productID = Integer.valueOf(request.getParameter("productID").intValue();
		
		if (Objects.equals(action, "add")) {
			carrello.addProdotto(productID, 1);
		}
		else if (Objects.equals(action, "delete")) {
			carrello.deleteProdotto(productID);
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Catalog.jsp");
		dispatcher.forward(request, response);		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException {
		doGet(request, response);
	}
}
