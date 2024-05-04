<%@ page
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"

	language="java"
	
	import="it.coinstellation.model.database.Database"
	import="it.coinstellation.model.entity.ProdottoDisponibile"
	import="it.coinstellation.model.Carrello"

	import="java.util.List"
	import="java.util.Map"
	import="java.util.Map"

	import="javax.servlet.http.HttpSession"
%>

<% // Estrae il catalogo
	final Carrello carrello = (Carrello) session.getAttribute("cart");

	final Map<Integer, Integer> prodottiCarrello = carrello.getProdotti();

	final List<ProdottoDisponibile> catalogo = Database.getInstance()
														.getProdottoDAO()
														.queryProdotti(prodottiCarrello.keySet());
%>


<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Ordine</title>
</head>

<body>
	<h2>Dati di consegna</h2>
		<form method="POST" action="/order">
			<fieldset>
				<legend>Nome e Contatti</legend>
				
				<label for="nome">Nome</label>
				<input name="nome" type="text"> <br>

				<label for="cognome">Cognome</label>
				<input name="cognome" type="text"> <br>
				
				<label for="email">Email</label>
				<input name="email" type="email"> <br>
				
				<label for="password">Password</label>
				<input name="password" type="password"> <br>
			</fieldset>
			
			<fieldset>
				<legend>Indirizzo di spedizione</legend>
				
				<label for="città">Città</label>
				<input name="città" type="text"> <br>

				<label for="provincia">Provincia</label>
				<input name="provincia" type="text"> <br>

				<label for="codice_postale">Codice postale</label>
				<input name="codice_postale" type="text"> <br>

				<label for="via">Via</label>
				<input name="via" type="text">
				
				<label for="numero_civico">Numero civico</label>
				<input name="numero_civico" type="number">
			</fieldset>
			
			<fieldset>
				<legend>Metodo di pagamento</legend>
				<label for="nome_titolare">Nome titolare</label>
				<input name="nome_titolare" type="text"> <br>

				<label for="cognome_titolare">Cognome titolare</label>
				<input name="cognome_titolare" type="text"> <br>
				
				<p>Tipo:</p> <br>
				<input name="metodo_pagamento" type="radio" value="carta di credito"> <br>
				<input name="metodo_pagamento" type="radio" value="conto corrente">
				
				<fieldset>
					<legend>Carta di credito</legend>
						<label for="numero_carta">Numero carta</label>
						<input name="numero_carta" type="number"> <br>
				
						<label for="data_scadenza">Data scadenza</label>
						<input name="data_scadenza" type="date">
				</fieldset>
				
				<fieldset>
					<legend>Conto corrente</legend>
						<label for="iban">IBAN</label>
						<input name="iban" type="number"> <br>
				
						<label for="codice_bic">Codice BIC</label>
						<input name="codice_bic" type="number">
				</fieldset>
				
			</fieldset>
			
			<input name="reset" type="reset" value="Azzera tutto">
			<input name="acquista" type="submit" value="Acquista">
		</form>

	<h2>Riepilogo ordine</h2>
	<table border="1">
		<tr>
			<th>Prodotto</th>
			<th>ID</th>
			<th>Nome</th>
			<th>Tipo</th>
			<th>Valore nominale</th>
			<th>Anno</th>
			<th>Nazione</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Unità</th>
			<th>Altro</th>
		</tr>

		<%
			if (!catalogo.isEmpty()) {
				for (ProdottoDisponibile p: catalogo) {
		%>
					<tr>
						<td><img src="immagini/<%=p.getId()%>.jpg"></td>
						<td><%=p.getId()%></td>
						<td><%=p.getNome()%></td>
						<td><%=p.getTipo()%></td>
						<td><%=p.getValoreNominale()%></td>
						<td><%=p.getAnno()%></td>
						<td><%=p.getNazione()%></td>
						<td><%=p.getDescrizione()%></td>
						<td><%=p.getPrezzo()%></td>
						<td><%=prodottiCarrello.get(p.getId())%></td>
						<td> 
							<a href="cart?action=add&productID=<%=p.getId()%>">Add unit</a> <br>
							<a href="cart?action=remove&productID=<%=p.getId()%>">Remove unit</a> <br>
							<a href="cart?action=removeAll&productID=<%=p.getId()%>">Remove all</a> 
						</td>
					</tr>
		<%
				}
			} 
			else {
		%>
				<tr><td colspan="6">Il carrello è vuoto</td></tr>
		<%
			}
		%>
	</table>

</body>
</html>
