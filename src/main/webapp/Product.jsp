<%@ page
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"

	language="java"
	import="it.coinstellation.model.Carrello"
	import="it.coinstellation.model.database.Database"
	import="it.coinstellation.model.entity.ProdottoDisponibile"
%>

<%! // Estrae il prodotto da visualizzare
	int prodottoID = request.getAttribute("prodottoID");
	
	ProdottoDisponibile prodotto = Database.getInstance()
											.getProdottoDAO()
											.queryProdotto(prodottoID);

	Carrello carrello = session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Prodotto</title>
</head>

<body>
	<!-- Dettagli del prodotto -->
	<h3><%=prodotto.getNome()%></h3>
		<img src="immagini/<%=prodotto.getId()%>.jpg">
		<p>
			<ul>
				<li><b>Tipo</b>: <%=prodotto.getTipo().name()%></li>
				<li><b>Valore nominale</b>: <%=prodotto.getValoreNominale()%></li>
				<li><b>Anno</b>: <%=prodotto.getAnno()%></li>
				<li><b>Nazione</b>: <%=prodotto.getNazione()%></li>
				<li><b>Prezzo</b>: <%=prodotto.getPrezzo()%></li>
			</ul>
		</p>

		<h4>Descrizione</h4>
			<p><%=prodotto.getDescrizione()%></p>

	<br><br>

	<!-- Dati del carrello -->
	<p><b>Numero di unità nel carrello</b>: </p>
	
	<form action="\cart" method="POST">
	
	</form>
		
</body>
</html>
