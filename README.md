# Kiseleff

[<img src="https://user-images.githubusercontent.com/256/179401403-b7f40279-849b-448b-b00d-2f1b0054c14f.jpg" alt="10 Mai Zi Națională. Bătaia cu flori." align="right" height="300px" />](https://www.flickr.com/photos/halloweenhjb/50894560957)

> În istorie nu există miracole, ci, din când în când, întâmplări minunate; 
> există, câteodată, în viața popoarelor clipe privilegiate când, într-o 
> singură generație, destinul adună mai multe schimbări decât în câteva 
> veacuri de toropeală.
>
> - Neagu Djuvara, "Între Orient și Occident. Țările române la începutul epocii moderne"

"Kiseleff" este platforma Primăriei Sectorului 1 pentru a încuraja procesul de 
democraţie participativă la nivelul Sectorului 1, permiţând cetăţenilor să 
decidă cum se alocă o parte din bugetul primăriei şi, pe viitor, să participe la
elaborarea actelor legislative.

Platforma este bazată pe versiunea 1.5.0 a 
[Consul Project](https://consulproject.org/en/) şi pe modificarile făcute de
[Code 4 Romania](https://github.com/code4romania/consul) pentru a ajusta
platforma la cerinţele legale din România.


## Arhitectura

Kiseleff este o aplicatie de tip monolit scrisa in Ruby on Rails cu urmatoarele 
cerinte minime:
* Ubuntu 20.04
* Ruby 2.7.6
* PostgreSQL (versiunea 13 sau mai noua)
* Redis (versiunea 6 sau mai noua)
* Un serviciu SMTP (de exemplu Mailgun sau Sendgrid)

Suplimentar, aplicatia foloseste serviciul extern [Sentry](https://sentry.io/)
pentru monitorizarea erorilor si a performantei. Sentry e disponibil inclusiv 
ca serviciu [self-hosted](https://develop.sentry.dev/self-hosted/).

In productie, aplicatia poate fi rulata pe instante de minim 1GB RAM, cat timp
baza de date este un serviciu separat.

Un exemplu de [configurare minimala pe Heroku](https://www.heroku.com/pricing)
pentru un mediu de productie:
* 2 x Dyno Standard 2X
* 1 x Postgres Standard 0
* 1 x Redis Premium 0


## Development Setup

Se instaleaza Ruby 2.7.6 folosind un versiun manager precum 
[rbenv](https://github.com/rbenv/rbenv) pentru a evita potentialele probleme 
cauzate de OpenSSL 3.0:

```bash
$ rbenv install 2.7.6
```

Librariile se instaleaza via `bundler`:


```bash
$ bundle install
```

Serviciile externe (Postgres si Redis) pot fi rulate via Docker:

```bash
$ docker compose up -d
```

Exemplu de fisier `.env`:

```bash
# Local development settings
RAILS_ENV=development

# Do not start a cluster locally
WEB_CONCURRENCY=0

##
# Database settings
#
# The setup assumes there is a single Postgres server running locally and each
# database is stored locally.

# Main database
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=postgres
DATABASE_HOST=localhost

##
# Caching
# Redis, used for most of the caching
REDIS_URL='redis://localhost:6379'
```


## Licenta

Codul sursă este disponibil sub licenţă 
[AGPLv3](https://www.gnu.org/licenses/agpl-3.0.en.html).

Sursa afisului este contul de Flickr
[Halloween HJB](https://www.flickr.com/photos/halloweenhjb/50894560957).
