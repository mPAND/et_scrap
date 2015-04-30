# Economic Times Scrapper

Perl Script to download Economic Times magazine as pdf for offline viewing

## Syntax
    >>> perl 01_et_scrap.pl [R/M/A] [YYYYMMDD]
     where R - Regular News Paper
           M - Supplement Magazine
           A - All ( Regular + Supplement)

    >>> Passing No Arguments will download current days magazine if present

    >>> Passing 1 argument - R  -- Will download current days news paper
    >>> Passing 1 argument - A  -- Will download current days magazine and news paper
    >>> Passing 1 argument - M  -- Will download current days magazine only

## Details

Economic Times provides Business News on all days followed by additional magazine on certain days of week

| Day of Week |  Magazine name |
|:-------------|:---------------|
|   Monday   | ET Wealth|
|   Wednesday | Brand Equity|
|    Thursday | ET Travel , Panache|
|    Friday   |  Corporate Dossier|


This script helps to download either news paper or magazine or both from www.economictimes.indiatimes.com
 
Happy Reading !!
