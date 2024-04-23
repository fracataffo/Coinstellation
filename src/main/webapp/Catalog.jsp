<%@ page
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"

	language="java"
	import="it.coinstellation.model.database.Database"
	import="it.coinstellation.model.entity.ProdottoDisponibile"
	import="it.coinstellation.model.Carrello"
	import="java.util.List"
%>

<%! // Estrae il catalogo
	List<ProdottoDisponibile> catalogo = Database.getInstance()
											.getProdottoDAO()
											.queryProdottiDisponibili();
	Carrello carrello = new Carrello();
%>

<%
	session.setAttribute("cart", carrello);
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
						<td> <a href="cart?action=delete&productID=#{p.getId()}">Delete</a> <br>
							<a href="cart?action=add&productID=#{p.getId()}">Add</a> <br> </td>
					</tr>
		<%
				}
			} 
			else {
		%>
				<tr><td colspan="6">No products available</td></tr>
		<%
			}
		%>
	</table>

</body>
</html>
