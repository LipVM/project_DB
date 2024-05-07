create schema furniture_store;
create table furniture_store.productFurniture
(
	furniture_id SERIAL PRIMARY KEY,
	furniture_name TEXT,
	description_product VARCHAR(255),
	price DECIMAL,
	quantity_product INTEGER
);

create table furniture_store.customers
(
	customer_id SERIAL PRIMARY KEY,
	name_customer TEXT NOT NULL,
	adress VARCHAR(255) NOT NULL, 
	phone_number INTEGER NOT NULL,
	eamil VARCHAR(255) NOT NULL
);

create table furniture_store.orders
(
	orders_id SERIAL primary key,
	customer_id SERIAL,
	order_date TIMESTAMP,
	status_order BOOLEAN,
	foreign key (customer_id) references customers (customer_id)
);

create table furniture_store.sales
(
	sales_id SERIAL primary key,
	orders_id SERIAL,
	furniture_id SERIAL,
	quantity_sold_product INTEGER NOT NULL,
	sum_sale DECIMAL NOT NULL,
	foreign key (orders_id) references orders (orders_id),
	foreign key (furniture_id) references productFurniture (furniture_id)
);

create table furniture_store.suppliers
(
	id_suppliers SERIAL primary key,
	name_suppliers TEXT NOT NULL,
	adress VARCHAR(255) NOT NULL, 
	phone_number INTEGER NOT NULL,
	eamil VARCHAR(255) NOT NULL,
	product_supplier TEXT 
);

create table furniture_store.staff
(
	staff_id SERIAL primary key,
	employees_name_surname VARCHAR(255) NOT NULL,
	position_employee VARCHAR(255) NOT NULL,
	start_date DATE
);

create table furniture_store.customer_reviews
(
	review_id SERIAL primary key,
	customer_id SERIAL,
	review_evaluation INTEGER,
	content_review text,
	foreign key (customer_id) references customers (customer_id)
);

create table furniture_store.delivery
(
	delivery_id SERIAL primary key,
	orders_id SERIAL,
	date_delivery DATE NOT NULL,
	status_delivery BOOLEAN NOT NULL,
	staff_id SERIAL,
	foreign key (orders_id) references orders (orders_id),
	foreign key (staff_id) references staff (staff_id)
);

create table furniture_store.return_product
(
	id_return SERIAL primary key,
	sales_id SERIAL,
	reason_for_return text NOT NULL,
	date_return DATE NOT NULL,
	foreign key (sales_id) references sales (sales_id)
);
