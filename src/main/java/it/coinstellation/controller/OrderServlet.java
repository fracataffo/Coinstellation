package it.coinstellation.controller;

import it.coinstellation.model.Carrello;
import it.coinstellation.model.database.Database;
import it.coinstellation.model.entity.Ordine;

import java.lang.IllegalArgumentException;
import java.lang.IllegalStateException;

import java.time.Instant;
import java.time.LocalDate;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public final class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException {
		/* Prodotti ordinati */
		Carrello carrello = (Carrello) Objects.requireNonNull(
			request.getSession().getAttribute("cart")
		);
		
		Map<Integer, Integer> prodotti = carrello.getProdotti();
		
		if (prodotti.isEmpty()) {
			throw new IllegalStateException("Il carrello è vuoto");
		}

		/* Nome e contatti */
		String nome = (String) request.getAttribute("nome");
		String cognome = (String) request.getAttribute("cognome");
		String email = (String) request.getAttribute("email");
		String password = (String) request.getAttribute("password");

		/* Indirizzo di spedizione */
		String citta = (String) request.getAttribute("città");
		String provincia = (String) request.getAttribute("provincia");
		String codicePostale = (String) request.getAttribute("codice_postale");
		String via = (String) request.getAttribute("via");
		String numeroCivico = (String) request.getAttribute("numero_civico");

		/* Metodo di pagamento */
		String nomeTitolare = (String) request.getAttribute("nome_titolare");
		String cognomeTitolare = (String) request.getAttribute("cognome_titolare");
		String metodoPagamento = (String) request.getAttribute("metodo_pagamento");

		String numeroCarta, dataScadenza; // dati Carta di credito
		String iban, codiceBIC; // dati Conto corrente

		if (Objects.equals(metodoPagamento, "carta di credito")) {
			numeroCarta = (String) request.getAttribute("numero_carta");
			dataScadenza = (String) request.getAttribute("data_scadenza");
			
			iban = null;
			codiceBIC = null;
		} else if (Objects.equals(metodoPagamento, "conto corrente")) {
			iban = (String) request.getAttribute("iban");
			codiceBIC = (String) request.getAttribute("codice_bic");
			
			numeroCarta = null;
			dataScadenza = null;
		} else {
			throw new IllegalArgumentException("Il valore del parametro 'metodo_pagamento' non è corretto: " +
					metodoPagamento);
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
