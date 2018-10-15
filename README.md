# Sf4 workshop

# Requisiti

- Docker

# Avvio applicazione

Dalla root del progetto creare l'ambiente docker lanciando:
- `docker-compose up -d`

Per controllare se l'applicazione sta funzionando correttamente entrare nel container php:
- `docker exec -it sf4_php /bin/bash`

Posizionarsi nella root del progetto `demo`:
- `cd /var/www/demo`

Lanciare composer:
- `composer install`

Posizionarsi nella root del progetto `skeleton`:
- `cd /var/www/skeleton`

Lanciare composer:
- `composer install`

Far partire il webserver (sempre dalla root di skeleton):
- `php bin/console server:start *:8000`

Aprire il browser andando all'indirizzo `http://localhost:8000/`

Dovresti vedere la pagina di defatult di symfony:
- `Welcome to Symfony 4` ecc