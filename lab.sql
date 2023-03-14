CREATE TABLE users (
	users_id SERIAL PRIMARY KEY,
	username VARCHAR NOT NULL,
	email VARCHAR NOT NULL,
	password VARCHAR NOT NULL
);

CREATE TABLE ingredients (
	ingredients_id SERIAL PRIMARY KEY,
	tomato VARCHAR,
	spaghetti_noodles VARCHAR,
	cheese VARCHAR
);

CREATE TABLE recipes (
	recipes_id SERIAL PRIMARY KEY,
	users_id INT REFERENCES users(users_id),
	ingredients_id INT REFERENCES ingredients(ingredients_id),
	instructions VARCHAR NOT NULL,
	is_public BOOLEAN NOT NULL
);

CREATE TABLE recipes_ingredients (
	recipes_ingredients_id SERIAL PRIMARY KEY,
	recipes_id INT REFERENCES recipes(recipes_id),
	ingredients_id INT REFERENCES ingredients(ingredients_id)
);

CREATE TABLE cart (
	cart_id SERIAL PRIMARY KEY,
	users_id INT REFERENCES users(users_id),
	ingredients_id INT REFERENCES ingredients(ingredients_id)
);

CREATE TABLE occasions (
	occasions_id SERIAL PRIMARY KEY,
	recipes_id INT REFERENCES recipes(recipes_id),
	name VARCHAR,
	date INT
);

CREATE TABLE occasions_recipes (
	occasions_recipes_id SERIAL PRIMARY KEY,
	occasions_id INT REFERENCES occasions(occasions_id),
	recipes_id INT REFERENCES recipes(recipes_id)
);