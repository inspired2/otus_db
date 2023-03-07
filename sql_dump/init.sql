CREATE TABLE "product" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "description" varchar(255),
  "barcode" bigint UNIQUE,
  "fk_manufacturer" int NOT NULL,
  "fk_category" int NOT NULL
);

CREATE TABLE "category" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar(20) NOT NULL,
  "fk_parent_category" int
);

CREATE TABLE "supplier" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "INN" SERIAL UNIQUE NOT NULL,
  "name" varchar(100) NOT NULL
);

CREATE TABLE "customer" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar(100) NOT NULL
);

CREATE TABLE "price_type" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "type_name" varchar(10) UNIQUE NOT NULL
);

CREATE TABLE "product_price" (
  "fk_product" bigint NOT NULL,
  "fk_price_type" int NOT NULL,
  "value" decimal NOT NULL,
  PRIMARY KEY ("fk_product", "fk_price_type")
);

CREATE TABLE "supply" (
  "fk_supplier" int NOT NULL,
  "id" SERIAL PRIMARY KEY NOT NULL,
  "date" DATE NOT NULL
);

CREATE TABLE "product_supply" (
  "fk_supply" bigint NOT NULL,
  "fk_product" bigint NOT NULL,
  "amount" int NOT NULL,
  PRIMARY KEY ("fk_product", "fk_supply")
);

CREATE TABLE "manufacturer" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar(100) UNIQUE NOT NULL
);

CREATE TABLE "sale" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "fk_customer" bigint NOT NULL,
  "date" DATE NOT NULL
);

CREATE TABLE "product_sale" (
  "fk_product" bigint NOT NULL,
  "fk_sale" bigint NOT NULL,
  "amount" int NOT NULL,
  "price" int NOT NULL,
  PRIMARY KEY ("fk_sale", "fk_product")
);

ALTER TABLE "product" ADD CONSTRAINT "product_fk0" FOREIGN KEY ("fk_manufacturer") REFERENCES "manufacturer" ("id");

ALTER TABLE "product_price" ADD CONSTRAINT "product_price_fk0" FOREIGN KEY ("fk_product") REFERENCES "product" ("id");

ALTER TABLE "product_price" ADD CONSTRAINT "product_price_fk1" FOREIGN KEY ("fk_price_type") REFERENCES "price_type" ("id");

ALTER TABLE "supply" ADD CONSTRAINT "supply_fk0" FOREIGN KEY ("fk_supplier") REFERENCES "supplier" ("id");

ALTER TABLE "product_supply" ADD CONSTRAINT "product_supply_fk0" FOREIGN KEY ("fk_product") REFERENCES "product" ("id");

ALTER TABLE "product_supply" ADD CONSTRAINT "product_supply_fk1" FOREIGN KEY ("fk_supply") REFERENCES "supply" ("id");

ALTER TABLE "sale" ADD CONSTRAINT "sale_fk0" FOREIGN KEY ("fk_customer") REFERENCES "customer" ("id");

ALTER TABLE "product_sale" ADD CONSTRAINT "product_sale_fk0" FOREIGN KEY ("fk_sale") REFERENCES "sale" ("id");

ALTER TABLE "product_sale" ADD CONSTRAINT "product_sale_fk1" FOREIGN KEY ("fk_product") REFERENCES "product" ("id");

ALTER TABLE "product" ADD FOREIGN KEY ("fk_category") REFERENCES "category" ("id");

ALTER TABLE "category" ADD FOREIGN KEY ("fk_parent_category") REFERENCES "category" ("id");
