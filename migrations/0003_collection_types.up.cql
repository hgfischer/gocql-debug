CREATE TABLE IF NOT EXISTS collection_types (

	t_uuid           uuid,
	t_frozen_text    frozen<list<text>>,
	t_list_int       list<int>,
	t_map_int_text   map<int,text>,
	t_set_int        set<int>,
	t_tuple_int_int  tuple<int,int>,

	PRIMARY KEY (t_uuid)
);
