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
											.queryCatalogo();
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
	<h2>Catalogo</h2>
	<section id="main">
<%
if (!catalogo.isEmpty()) {
	for (ProdottoDisponibile p: catalogo) {
%>
	<article class="product" id="<%=p.getId()%>">
		<h3><%=p.getNome()%></h3>

		<div class="product_info">
			<ol>
				<li><span class="prezzo"><b>Prezzo:</b> <%=p.getId()%></span></li>
				<li><span class="valore_nominale"><b>Valore nominale:</b> <%=p.getValoreNominale()%></span></li>
				<li><span class="anno"><b>Anno:</b> <%=p.getAnno()%></span></li>
				<li><span class="nazione"><b>Nazione:</b> <%=p.getNazione()%></span></li>
				<li>
					<span class="add_cart"><a href="/cart?action=add&productID=#{p.getId()}">Aggiungi al carrello</a>
					</span>
				</li>
			</ol>
		</div>
	</article>
<%
	}
} else {
%>
	<div id="empty_catalog">Spiacente, al momento il catalogo è vuoto</div>
<%
}
%>
	</section>
	<a href="Cart.jsp">Vai al carrello</a> 

</body>
</html>
