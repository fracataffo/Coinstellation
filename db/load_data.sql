USE `CoinstellationDB`;

INSERT INTO Amministratore(id, nome, cognome, email, password, cellulare) VALUES
(1, 'Marietta', 'Devericks', 'mdevericks0@ovh.net', 'yL3*I0_TD4?Q/oz', '779-144-7590'),
(2, 'Agretha', 'Essam', 'aessam1@shareasale.com', 'cL8~(Rie{0x', '460-181-8071');

INSERT INTO Cliente(id, nome, cognome, email, password, cellulare) VALUES
(1, 'Engelbert', 'Guitt', 'eguitt0@nyu.edu', 'pQ7\\x?d', '291-354-0365'),
(2, 'Gwenneth', 'De Few', 'gdefew1@noaa.gov', 'jO1><LcFb#Bs''''1', '376-198-4966'),
(3, 'Thornie', 'Helks', 'thelks2@nydailynews.com', 'oA0.FZg3Z"/8', '446-772-4808'),
(4, 'Kakalina', 'Artz', 'kartz3@yellowbook.com', 'nR7%Vx1&', '229-761-5575'),
(5, 'Rori', 'Rawet', 'rrawet4@istockphoto.com', 'pA4<y,DY', '701-615-5885'),
(6, 'Louella', 'Hansbury', 'lhansbury5@yolasite.com', 'eS1,xLT8bde', '207-401-8450'),
(7, 'Gardy', 'Aldwich', 'galdwich6@sun.com', 'aE5=@5NUnE', '766-751-3928'),
(8, 'Nevsa', 'Kiffe', 'nkiffe7@discovery.com', 'lN2"m*X#', '882-963-6199');

INSERT INTO Indirizzo(id, num_civico, via, codice_postale, città, provincia) VALUES
(1, '131', 'A.G. Alaimo', '60010', 'Brugnetto', 'Ancona'),
(2, '39', 'Corso Vittorio Emanuele', '51030', 'Masiano', 'Pistoia'),
(3, '31', 'Via Domenico Morelli', '61015', 'Talamello', 'Perugia'),
(4, '103', 'Via Torino', '29010', 'Capremoldo', 'Piacenza'),
(5, '13', 'Via Genova', '90039', 'Villabate', 'Palermo'),
(6, '123', 'Via Matteo Schilizzi', '16015', 'Orero', 'Genova'),
(7, '127', 'Via Adua', '21029', 'Cimbro', 'Varese'),
(8, '92', 'Via Rocca de Baldi', '37030', 'Vestenanova', 'Verona'),
(9, '62', 'Via Bologna', '55020', 'Castelvecchio Pascoli', 'Lucca'),
(10, '4', 'Via Scuderlando', '64020', 'Guardia Vomano', 'Teramo'),
(11, '125', 'Piazza Cardinale Riario Sforza', '18024', 'Case Di Nava', 'Imperia'),
(12, '16', 'Piazza Guglielmo Pepe', '62010', 'Morrovalle', 'Macerata'),
(13, '47', 'Via Domenico Morelli', '65020', 'Rosciano', 'Pescara'),
(14, '135', 'Via Vico Ferrovia 135', '44100', 'Ferrara', 'Ferrara'),
(15, '38', 'Piazza Guglielmo Pepe', '62036', 'Appennino', 'Macerata'),
(16, '146', 'Via San Pietro Ad Aram', '41029', 'Casine', 'Modena'),
(17, '106', 'Piazza Giuseppe Garibaldi', '43053', 'Compiano', 'Parma'),
(18, '119', 'Vico Giganti', '06040', 'Ancarano', 'Perugia'),
(19, '114', 'Via Varrone', '81100', 'Staturano', 'Caserta'),
(20, '121', 'Via Sacchi', '33047', 'Ziracco', 'Udine'),
(21, '70', 'Via Vicenza', '40027', 'Bubano', 'Bologna'),
(22, '39', 'Corso Alcide De Gasperi', '32011', 'Cadola', 'Belluno'),
(23, '115', 'Via Antonio da Legnago', '89060', 'Cardeto', 'Reggio Calabria'),
(24, '77', 'Via Colonnello Galliano', '00050', 'Aurelia Di Civitavecchia', 'Roma'),
(25, '150', 'Stradone Anotnio Provolo', '05018', 'Orvieto', 'Termi'),
(26, '31', 'Via Cavour', '81047', 'Macerata Campania', 'Caserta'),
(27, '103', 'Piazza Guglielmo Pepe', '2910', 'CapreMoldo', 'Piacenza'),
(28, '1', 'Via Sacchi', '16015', 'Orero', 'Genova'),
(29, '37', 'Via Genova', '41029', 'Casine', 'Modena'),
(30, '49', 'Via Torino', '51030', 'Masiano', 'Pistoia');

INSERT INTO Cliente_Indirizzo(indirizzo, cliente) VALUES
(1, 6), (2, 2), (3, 6),
(4, 8), (5, 3), (6, 8),
(7, 3), (8, 5), (9, 1),
(10, 1), (11, 7), (12, 7),
(13, 1), (14, 2), (15, 4),
(16, 8), (17, 3), (18, 4),
(19, 4), (20, 8), (21, 5),
(22, 4), (23, 5), (24, 6),
(25, 2), (26, 6), (27, 6),
(28, 5), (29, 1), (30, 4);

-- FIXME: Correggere i valori secondo i corrispettivi pattern Regex.
-- Carte di credito
INSERT INTO Metodo_Pagamento(id, nome, cognome, tipo, numero_carta, data_scadenza) VALUES
(1, 'Andie', 'Slym', 'carta di credito', '5222652365893857', '01-2025'),
(2, 'Torie', 'Bidgod', 'carta di credito', '5007663930364663', '02-2025'),
(3, 'Florencia', 'Redpath', 'carta di credito', '5282353072205462', '03-2025'),
(4, 'Cassaundra', 'Forrington', 'carta di credito', '5190510811562690', '04-2025'),
(5, 'Joshia', 'Andreacci', 'carta di credito', '5385471578504216', '05-2025'),
(6, 'Marysa', 'Gilhoolie', 'carta di credito', '5002358567369920', '06-2025'),
(7, 'Dru', 'Stokoe', 'carta di credito', '5100133887616768', '07-2025'),
(8, 'Romonda', 'Cunliffe', 'carta di credito', '5534164572915898', '08-2025'),
(9, 'Betsey', 'Summerson', 'carta di credito', '5100145048899380', '09-2025'),
(10, 'Trudey', 'Missington', 'carta di credito', '5100139913696450', '10-2025'),
(11, 'Genevra', 'Aldine', 'carta di credito', '5007661176052257', '11-2025'),
(12, 'Danette', 'Comettoi', 'carta di credito', '5108754194385623', '12-2025'),
(13, 'Breena', 'Spieck', 'carta di credito', '5007663159791257', '01-2026'),
(14, 'Horten', 'Studman', 'carta di credito', '5100144233932965', '02-2026'),
(15, 'Randolf', 'Ranby', 'carta di credito', '5108752155960822', '03-2026');
-- Conti corrente
INSERT INTO Metodo_Pagamento(id, nome, cognome, tipo, iban, codice_bic) VALUES
(16, 'Sharron', 'Lightman', 'conto corrente', 'AD1400080001001234567890', 'DEKTDE7GXXX'),
(17, 'Kaycee', 'Clementucci', 'conto corrente', 'AT483200000012345864', 'GEBABEBB'),
(18, 'Hailee', 'Essam', 'conto corrente', 'BE71096123456769', 'BKAUATWW'),
(19, 'Antonin', 'Marlow', 'conto corrente', 'BG18RZBB91550123456789', 'COBADEFF060'),
(20, 'Henrie', 'June', 'conto corrente', 'HR1723600001101234565', 'UCJAES2MXXX'),
(21, 'Carlota', 'Tousey', 'conto corrente', 'CY21002001950000357001234567', 'ESSEDE5F100'),
(22, 'Nettie', 'Roome', 'conto corrente', 'CZ5508000000001234567899', 'CMCIFRPP'),
(23, 'Ellen', 'Hrus', 'conto corrente', 'DK9520000123456789', 'CHASFIHHXXX'),
(24, 'Adriaens', 'Callander', 'conto corrente', 'EE471000001020145685', 'PBNKDEFF100'),
(25, 'Wallas', 'Duffett', 'conto corrente', 'FI1410093000123458', 'ZUNOCZPP'),
(26, 'Petunia', 'Maase', 'conto corrente', 'FR7630006000011234567890189', 'ABNACHZ8XXX'),
(27, 'Toiboid', 'Broadwood', 'conto corrente', 'DE75512108001245126199', 'DNBANOKK'),
(28, 'Tedman', 'Zanussii', 'conto corrente', 'GI04BARC000001234567890', 'DEUTDEDB101'),
(29, 'Madlin', 'Giral', 'conto corrente', 'GR9608100010000001234567890', 'ARSPBE22'),
(30, 'Olvan', 'Hambelton', 'conto corrente', 'HU93116000060000000012345676', 'DXIADEBBXXX');

INSERT INTO Proprietà(cliente, metodo_pagamento) VALUES
(1, 2), (2, 3), (3, 1),
(4, 1), (5, 7), (6, 8),
(7, 1), (8, 6), (9, 7),
(10, 1), (11, 1), (12, 3),
(13, 5), (14, 6), (15, 6);

INSERT INTO Iva(id, valore) VALUES
(1, 17), (2, 11), (3, 25);

INSERT INTO Prodotto(id, nome, tipo, valore_nominale, anno, nazione, descrizione, disponibile, prezzo) VALUES
(1, '2 Euro commemorativa Rita Levi Montalcini', 'moneta', 200, 2024, 'Italia', 'Rita Levi-Montalcini (1909-2012) – Neuroscienziata italiana, vincitrice del Premio Nobel per la Fisiologia e la Medicina nel 1986, ricevuto insieme a Stanley Cohen per la scoperta dei fattori di crescita. Grazie a questa scoperta, gli scienziati hanno una migliore comprensione del cancro e della malattia di Alzheimer. A ventisette anni si laureò in medicina e quattro anni dopo in psichiatria e neurologia. Dal 2001 fino alla sua morte fu senatrice a vita anche al Senato italiano. Questo premio le è stato assegnato per i suoi significativi contributi scientifici. Il 22 aprile 2009 è diventata il primo premio Nobel a raggiungere i 100 anni.', true, 3500),
(2, '2 Euro commemotativa Diritto di voto per le donne', 'moneta', 200, 2023, 'Belgio', 'Nel 1948 il Belgio raggiunse un’importante pietra miliare con l’introduzione del suffragio universale femminile. Il Belgio invita le persone a onorare la storica lotta per i diritti delle donne. La moneta non solo rende omaggio al passato, ma può anche servire da ispirazione per la lotta in corso per l’uguaglianza di genere. Il Belgio è stato uno degli ultimi paesi europei a introdurre il suffragio femminile. Il ritardo nel suffragio femminile è dovuto principalmente ai primi sostenitori dei diritti delle donne come Marie Popeline e Isala Van Diest, che decisero di concentrarsi innanzitutto sul miglioramento dell’istruzione femminile e dell’uguaglianza giuridica in Belgio prima di sostenere la parità di suffragio. Inoltre, durante questo periodo, molti membri dei partiti socialista e liberale non si fidavano del voto delle donne, temendo che le donne votassero in modo troppo conservatore. Nel 2019, le donne ricoprivano il 42% delle posizioni parlamentari.', true, 3500),
(3, '1 Lek', 'banconota', 100, 1976, 'Albania', NULL, true, 1000),
(4, '5 Piastres', 'banconota', 500, 2004, 'Egitto', NULL, true, 1000),
(5, '100 Dollari', 'banconota', 10000, 1996, 'Hong Kong', NULL, true, 3000),
(6, '1 Dollaro moneta', 'moneta', 100, 2020, 'USA', 'Il telescopio spaziale Hubble, sviluppato dalla National Aeronautics and Space Administration della NASA e lanciato nel 1990, è uno dei più grandi e versatili telescopi spaziali. Squadre del Goddard Space Flight Center della NASA e dello Space Telescope Science Institute, entrambi situati nel Maryland, operano il telescopio. Il programma di emettere monete da $ 1 dedicato a “importanti invenzioni e approcci innovativi di individui e gruppi di persone provenienti da tutti gli stati, i territori e il Distretto di Columbia” è iniziato nel 2018. Il recto della rilasciata copia è lo stesso per tutte le altre monete della serie: raffigura la Statua della Libertà, la denominazione “$ 1”, il motto ufficiale del paese “In god We Trust” (“In god we trust”), così come le iniziali dell’incisore (Phoebe Humphill) e l’artista (Justin Koontz). Dal 2019, un segno aggiuntivo è anche posto sotto il motto. L’anno di conio, il marchio di zecca e il motto “E pluribus unum” (“Di molti, uno”) sono impressi sul bordo. Tutte le monete successive saranno emesse nello stesso ordine in cui è avvenuto l’ingresso degli stati nell’unione. Inoltre, verrà emessa una moneta dedicata al Distretto di Columbia e quindi all’innovazione nei Territori.', true, 500),
(7, '2 Sterline J. R. R. Tolkien', 'moneta', 200, 2023, 'UK', 'John Ronald Reuel Tolkien (1892-1973) – Scrittore, poeta, traduttore, linguista e filologo britannico. È meglio conosciuto come l’autore di classici dell’high fantasy: Lo Hobbit, o Andata e ritorno, Il Signore degli Anelli e Il Silmarillion. L’amore di Tolkien per le lingue iniziò da bambino e questa passione, unita all’interesse per la mitologia norrena e celtica, lo portò successivamente a inventare il regno della Terra di Mezzo e la mitologia che lo circonda. Scrisse persino poesie e creò opere d’arte ispirate a questo mondo, alcune delle quali furono incluse nelle sue opere più famose, Lo Hobbit (1937) e Il Signore degli Anelli (1954–55), l’ultima delle quali portò Tolkien alla fama mondiale. ed è ora considerato un esempio di narrativa fantasy moderna. Tolkien morì nel 1973 e l’opera della sua vita che forniva un resoconto completo della sua mitologia elfica, Il Silmarillion, rimase inedita. Il figlio più giovane di Tolkien, Christopher, modificò postumo l’opera e alla fine fu pubblicata nel 1977. Insieme all’iscrizione “SCRITTORE • POETA • SCIENZIATO”, il rovescio della moneta mostra gli anni di nascita e morte di J. R.R. Tolkien. Il rovescio della moneta presenta il monogramma unico di Tolkien circondato da un elaborato disegno runico. L’iscrizione sul bordo della moneta è “Non tutti coloro che vagano sono perduti” – una citazione dal poema di Tolkien “L’enigma del camminatore”.', false, 1600),
(8, '10 Grivna Forze di supporto delle Forze Armate dell’Ucraina', moneta, 10, 2023, 'Ucraina', 'La moneta è dedicata a un tipo separato di truppe delle Forze Armate dell’Ucraina – le Forze di Supporto delle Forze Militari dell’Ucraina, che sono responsabili della fornitura operativa di supporto tecnico, radiazioni, protezione chimica e biologica, supporto topografico e idrometeorologico per truppe. Motivo: emblema delle forze di supporto delle forze armate ucraine.', true, 200),
(9, '1000 Dinara', 'banconota', 1000, 1992, 'Iugoslavia', NULL, true, 1000),
(10, '1000 Won', 'banconota', 1000, 1983, 'Corea del Sud', NULL, true, 1200),
(11, '100 Lire Capranesi', 'banconota', 100, 1943, 'Italia', NULL, true, 2070),
(12, 'Ducato di Svezia', 'moneta', 100, 1866, 'Svezia', NULL, true, 1500),
(13, '1000 Lire Biglietto Consorziale Regno D\'Italia', 'banconota', 1000, 1874, 'Italia', NULL, true, 9430),
(14, 'Moneta d\'oro 100$ Australia 2023 - Canguro', 'moneta', 100, 2023, 'Australia', 'Perfetta per l\'investitore, questa moneta di canguro australiano è coniata in oro puro al 99,99% da 1 oncia e presenta una nuova immagine del marsupiale più famoso del mondo.Il design 2023 presenta un canguro che si guarda alle spalle su uno sfondo di eucalipti e alberi erbosi.', true, 2000);
