CREATE TABLE IF NOT EXISTS points(
	id int NOT NULL AUTO_INCREMENT,
	lat int NOT NULL,
	lng int NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS edges(
	id int NOT NULL AUTO_INCREMENT,
	id1 int NOT NULL,
	id2 int NOT NULL,
	dist int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id1) REFERENCES points(id),
	FOREIGN KEY (id2) REFERENCES points(id)
);

LOAD DATA LOCAL INFILE 'data/raw/points.dat' INTO TABLE points 
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(id, lat, lng);

LOAD DATA LOCAL INFILE 'data/raw/edges.dat' INTO TABLE edges 
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(id1, id2, dist);