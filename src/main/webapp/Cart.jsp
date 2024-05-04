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
	<link href="CatalogStyle.css" rel="stylesheet" type="text/css">
	<title>Catalogo</title>
</head>

<body>
	<h2>Prodotti</h2>

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
							<a href="cart?action=increment&productID=<%=p.getId()%>">Add unit</a> <br>
							<a href="cart?action=decrement&productID=<%=p.getId()%>">Remove unit</a> <br>
							<a href="cart?action=remove&productID=<%=p.getId()%>">Remove all</a> 
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
