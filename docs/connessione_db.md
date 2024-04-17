# `context.xml`
Il file `context.xml` non è tracciato dalla repo git, così da evitare il *leak* delle credenziali
della connessione.

## contenuto del file
```xml
<?xml version="1.0" encoding="UTF-8"?>

<Context>
	<Resource
		name="jdbc/CoinstellationDB"
		auth="Container"
		driverClassName="com.mysql.cj.jdbc.Driver"
		username="<user>"
		password="<password>"
		type="javax.sql.DataSource"
		url="jdbc:mysql://localhost:3306/CoinstellationDB" 
	/>
</Context>
```

Sostituire `<user>`, `<password>` e `<url>` con le proprie credenziali.

Salvare il file nella cartella `META-INF`.

# Caricare il Driver
Il Driver in formato jar deve essere presente in `WEB-INF/lib`.
