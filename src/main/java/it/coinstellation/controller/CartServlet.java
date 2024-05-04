package it.coinstellation.controller;

import it.coinstellation.model.Carrello;

import java.io.IOException;

import java.lang.Integer;

import java.util.Objects;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

public final class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		if(request.getSession().getAttribute("cart") == null) {
			request.getSession().setAttribute("cart", new Carrello());
		}

		Carrello carrello = (Carrello) request.getSession().getAttribute("cart");

		int prodottoID = Integer.valueOf(request.getParameter("productID")).intValue();
		String action = request.getParameter("action");

		if (Objects.equals(action, "add")) {
			carrello.addProdotto(prodottoID);
		}
		else if (Objects.equals(action, "remove")) {
			carrello.removeProdotto(prodottoID);
		}
		else if (Objects.equals(action, "removeAll")) {
			carrello.removeAllProdotto(prodottoID);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Catalog.jsp");
		dispatcher.forward(request, response);		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doGet(request, response);
	}
}
