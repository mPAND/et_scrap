# Economic Times Scrapper

Perl Script to download Economic Times magazine as pdf for offline viewing

## Syntax
    >>> perl 01_et_scrap.pl [R/M/A] [YYYYMMDD]
     where R - Regular News Paper
           M - Supplement Magazine
           A - All ( Regular + Supplement)

## Details

Economic Times provides Regular Newspaper on all days
following by additional magazine on certain days

| Day of Week |  Magazine name |
|:-------------|:---------------|
|   Monday   | ET Wealth|
|   Wednesday | Brand Equity|
|    Thursday | ET Travel , Panache|
|    Friday   |  Corporate Dossier|


This script helps to download either news paper or magazine or both from www.economictimes.indiatimes.com
 
    >>> Passing No Arguments will download current days magazine if present

    >>> Passing 1 argument - R  -- Will download current days news paper
    >>> Passing 1 argument - A  -- Will download current days magazine and news paper
    >>> Passing 1 argument - M  -- Will download current days magazine only

    >>> Passing 2 argument - R/M/A YYYYMMDD will download particular days paper/magazine/both 
