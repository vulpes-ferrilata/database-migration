CREATE TABLE message (
	id timeuuid,
	room_id text,
	user_id text,
	detail text,
	PRIMARY KEY (room_id, id)
) WITH CLUSTERING ORDER BY (id ASC);