package it.coinstellation.controller;

import it.coinstellation.model.entity.;

import java.lang.IllegalArgumentException;
import java.lang.IllegalStateException;

import java.time.Instant;
import java.tine.LocalDate;

import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public final class OrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException {
		/* Prodotti ordinati */
		Carrello carrello = Objects.requireNonNull(
			request.getSession().getAttribute("cart")
		);
		
		Map<Integer, Integer> prodotti = carrello.getProdotti();
		
		if (prodotti.isEmpty()) {
			throw new IllegalStateException("Il carrello è vuoto");
		}

		/* Nome e contatti */
		String nome = request.getAttribute("nome");
		String cognome = request.getAttribute("cognome");
		String email = request.getAttribute("email");
		String password = request.getAttribute("password");

		/* Indirizzo di spedizione */
		String citta = request.getAttribute("città");
		String provincia = request.getAttribute("provincia");
		String codicePostale = request.getAttribute("codice_postale");
		String via = request.getAttribute("via");
		String numeroCivico = request.getAttribute("numero_civico");

		/* Metodo di pagamento */
		String nomeTitolare = request.getAttribute("nome_titolare");
		String cognomeTitolare = request.getAttribute("cognome_titolare");
		String metodoPagamento = request.getAttribute("metodo_pagamento");

		String numeroCarta, dataScadenza; // dati Carta di credito
		String iban, codiceBIC; // dati Conto corrente

		if (Objects.equals(metodoPagamento, "carta di credito") {
			numeroCarta = request.getAttribute("numero_carta");
			dataScadenza = request.getAttribute("data_scadenza");
			
			iban = null;
			codiceBIC = null;
		} else if (Objects.equals(metodoPagamento, "conto corrente") {
			iban = request.getAttribute("iban");
			codiceBIC = request.getAttribute("codice_bic");
			
			numeroCarta = null;
			dataScadenza = null;
		} else {
			throw new IllegalArgumentException("Il valore del parametro 'metodo_pagamento' non è corretto: "+metodoPagamento);
		}

		Ordine ordine = new Ordine(1, Instant.now(), LocalDate.now().plusWeeks(7), null, 500L, 1, 1, 1, 1, 1);
		
		Database.getInstance()
					.getOrdineDAO()
					.insertOrdine(ordine, prodotti);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException {
		doGet(request, response);
	}
}
