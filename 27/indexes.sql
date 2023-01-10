CREATE INDEX year ON wine(year);

select wineName from wine where year >= 2022;
-- without index
| id | select_type | table | partitions | type  | possible_keys | key  | key_len | ref  | rows | filtered | Extra                 |
+----+-------------+-------+------------+-------+---------------+------+---------+------+------+----------+-----------------------+
|  1 | SIMPLE      | wine  | NULL       | range | year          | year | 5       | NULL |    4 |   100.00 | Using index condition

-- with index
+----+-------------+-------+------------+-------+---------------+------+---------+------+------+----------+-----------------------+
| id | select_type | table | partitions | type  | possible_keys | key  | key_len | ref  | rows | filtered | Extra                 |
+----+-------------+-------+------------+-------+---------------+------+---------+------+------+----------+-----------------------+
|  1 | SIMPLE      | wine  | NULL       | range | year          | year | 5       | NULL |    4 |   100.00 | Using index condition |
+----+-------------+-------+------------+-------+---------------+------+---------+------+------+----------+-----------------------+


CREATE INDEX typename ON wine_type(typename)

select typename from wine_type where typename = 'Cabernet Sauvignon';

-- without index
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | wine_type | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   11 |    10.00 | Using where |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------------+

-- with index
+----+-------------+-----------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | wine_type | NULL       | ref  | typename      | typename | 1022    | const |    1 |   100.00 | Using index |
+----+-------------+-----------+------------+------+---------------+----------+---------+-------+------+----------+-------------+



--     полнотекстовый индекс

CREATE FULLTEXT INDEX title_description ON wine(winename, description);

SELECT * FROM wine WHERE MATCH (winename, description) AGAINST ('Estate');

+----+-------------+-------+------------+----------+-------------------+-------------------+---------+-------+------+----------+-------------------------------+
| id | select_type | table | partitions | type     | possible_keys     | key               | key_len | ref   | rows | filtered | Extra                         |
+----+-------------+-------+------------+----------+-------------------+-------------------+---------+-------+------+----------+-------------------------------+
|  1 | SIMPLE      | wine  | NULL       | fulltext | title_description | title_description | 0       | const |    1 |   100.00 | Using where; Ft_hints: sorted |
+----+-------------+-------+------------+----------+-------------------+-------------------+---------+-------+------+----------+-------------------------------+
