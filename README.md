# Economic Times News Paper Scrapper

Perl Script to download Economic Times Newspaper as pdf for offline viewing

## Syntax
    >>> perl economictimes_download.pl [R/M/A] [YYYYMMDD]
     
     where R - Regular News Paper
           M - Supplement Magazine
           A - All ( Regular + Supplement)
    YYYYMMDD - Particular day's new paper
    
    Passing No Arguments will download current days magazine if present
    Passing - R  -- Will download current days news paper
    Passing - A  -- Will download current days magazine and news paper
    Passing - M  -- Will download current days magazine only
    Passing - R 20150401  -- Will download Apr 1st 2015's regular news paper
    
## Details

Economic Times provides regular business News on all days followed by additional magazine on certain days of week.

| Day of Week  |  Magazine name |
|:-------------|:---------------|
|   Monday     | ET Wealth      |
|   Wednesday  | Brand Equity   |
|    Thursday  | ET Travel , Panache |
|    Friday    |  Corporate Dossier |

This script helps to download either news paper or magazine or both from www.economictimes.indiatimes.com
 
Happy Reading !!
