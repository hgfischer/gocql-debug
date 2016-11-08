# GoCQL Debug


## Dependencies

* Go >= 1.7.0
* Vagrant >= 1.8.x


## Run

```
make all
```


## Output

```
go run main.go
2016/11/08 11:18:22 map[t_decimal:18331.2402 t_varchar:czKwy5Msq6yTuDMmFRDb3KJ6mzsfFGpp t_timeuuid:98d25060-a59c-11e6-8fd1-ab38fbd15528 t_varint:18757 t_uuid:f3338375-40b6-49a3-b540-09fdd38e7f10 t_ascii:9FIqWF3IXnCi9wD6UbvJENBnwjFgB9XL t_bigint:7428 t_boolean:false t_double:3310.4219 t_int:6945 t_blob:[36 146 65 59 49 205 241 223 51 18 163 29 47 184 204 203 30 37 53 163 126 176 37 126 13 98 242 20 61 253 251 33] t_inet:14.231.137.222 t_text:ren7DYp7fhpGsvT7yrA5R3X4lT6h9tUR t_timestamp:1970-01-01 07:52:06 +0000 UTC t_float:21966.604]
2016/11/08 11:18:22 can not unmarshal X uuid into gocql.UUID
2016/11/08 11:18:22 map[t_set_int:[16280 32210] t_tuple_int_int[0]:350 t_tuple_int_int[1]:18097 t_uuid:747a5358-bba5-4478-8dae-9a9f910aaa19 t_frozen_text:[fppmsOGwzQzggeZbdasc3fyPfY36pbOa 9U3r0OehGp6B4AFB0r6kbPdIVwO2AvLx] t_list_int:[17672 1742] t_map_int_text:map[18581:ZlVZor5AAEC6Yrck6t3ToQ4RjOcf6Ugx 27667:vus6VbyRZ9kvLXltwBVUYIGJm1y9fTTw]]
2016/11/08 11:18:22 can not unmarshal X uuid into gocql.UUID
```
