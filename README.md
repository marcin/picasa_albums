picassaAlbums
=============

combines pictures in the monthly albums (by directiories 2014-01, 2014-03 ...)



Jak działa
===========
Picassa potrafi zgrać zdjęcia do katalogów z datą stworzenia zdjęcia. Jeśli chcemy mieć mniej katalogów to możemy połączyć je w katalogi miesiączne. Dzieki temu mamy miesięczne albumy które łatwiej zsynchronizować z Google Plus.



Jak uruchomić
===========
w katalog głównym (którego podkatalogami są albumy stworzone przez Picasse czyli 2013-12-03, 2013-12-12, 2014-01-01 itp) wykonujemy:


```shell
ruby picassa_album.rb /path/to/directory
```

po tym zdjęcia zostaną przeniesione do katalogów miesięcznych (2013-12, 2014-01 itp)


