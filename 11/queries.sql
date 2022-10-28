!!!!!!!!!!!!!!!!! 1 !!!!!!!!!!!!!!!!!
CREATE INDEX year ON wine.wine(year);

!!!!!!!!!!!!!!!!! 2 !!!!!!!!!!!!!!!!!
select winename from wine.wine where year > 2021; -

Seq Scan on wine as wine (actual=0.088..0.412 rows=35 loops=1)
Filter: (year > 2021)
Rows Removed by Filter: 315
0.412 ms	0.412 ms

Index Scan using year on wine as wine (actual=0.023..0.049 rows=35 loops=1)
Index Cond: (year > 2021)
0.049 ms	0.049 ms


CREATE INDEX year ON wine.winetype(typename)
select typename from wine.winetype where typename = 'Cabernet Sauvignon';

Bitmap Heap Scan on winetype as winetype (actual=0.33..0.365 rows=12 loops=1)
Recheck Cond: ((typename)::text = 'Cabernet Sauvignon'::text)
Heap Blocks: exact=2
0.108 ms	0.365 ms

!!!!!!!!!!!!!!!!! 3 !!!!!!!!!!!!!!!!!
Создала темпорари таблицу с тестовой колонкой, мне для БД не требуется полнотекстовый поиск
alter table wine.winetype add column tmptsvector tsvector;
update wine.winetype set tmptsvector = to_tsvector(typename);
select typename from tickets where tmptsvector @@ to_tsquery('Cabernet | Merlot' );
CREATE INDEX tmptsvector ON wine.winetype USING GIN (tmptsvector);
select typename from wine.winetype where tmptsvector @@ to_tsquery('Cabernet' );

Seq Scan on winetype as winetype (actual=0.022..1.182 rows=16 loops=1)
Filter: (tmptsvector @@ to_tsquery('Cabernet'::text))
Rows Removed by Filter: 479
1.182 ms	1.182 ms

Bitmap Heap Scan on winetype as winetype (actual=0.198..0.23 rows=16 loops=1)
Recheck Cond: (tmptsvector @@ to_tsquery('Cabernet'::text))
Heap Blocks: exact=4
0.066 ms	0.23 ms
!!!!!!!!!!!!!!!!! 4 !!!!!!!!!!!!!!!!!

create index cabernet on wine.winetype(typename) where typename = 'Cabernet Sauvignon';
select typename from wine.winetype where typename = 'Cabernet Sauvignon';

Index Only Scan using cabernet on winetype as winetype (actual=0.021..0.025 rows=12 loops=1)	0.025 ms	0.025 ms

!!!!!!!!!!!!!!!!! 5 !!!!!!!!!!!!!!!!!
CREATE INDEX nameYear ON wine.wine(winename, year);

select winename, year from wine.wine where year <= 2015 and winename='Museum Release Art'
Index Only Scan using nameyear on wine as wine (actual=0.041..0.043 rows=1 loops=1)
Index Cond: ((winename = 'Museum Release Art'::text) AND (year <= 2015))
0.043 ms	0.043 ms

!!!!!!!!!!!!!!!!! 7 !!!!!!!!!!!!!!!!!
Если данных мало индекс не применялся
Если в результате слишком много данных, то тоже
Если в индексном поле много null, то индекс тоже не применялся
