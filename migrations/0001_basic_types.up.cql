CREATE TABLE IF NOT EXISTS basic_types (

	t_uuid       uuid,
	t_ascii      ascii,
	t_bigint     bigint,
	t_blob       blob,
	t_boolean    boolean,
	t_decimal    decimal,
	t_double     double,
	t_float      float,
	t_inet       inet,
	t_int        int,
	t_text       text,
	t_timestamp  timestamp,
	t_timeuuid   timeuuid,
	t_varchar    varchar,
	t_varint     varint,

	PRIMARY KEY (t_uuid)
);
