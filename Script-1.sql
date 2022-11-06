CREATE extension IF NOT exists "uuid-ossp";

CREATE TABLE carts (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  created_at date NOT NULL,
  updated_at date NOT NULL
)

CREATE TABLE cart_items (
  cart_id d uuid,
  product_id uuid,
  count integer,
  FOREIGN KEY ("cart_id") REFERENCES "carts" ("id")
)

INSERT INTO carts (created_at,updated_at) VALUES
(now(),now())

INSERT INTO cart_items (cart_id, product_id, count) VALUES 
('6dbb70c8-2241-4bed-ab30-b4a38a5d0d1b', uuid_generate_v4(), 2),
('6dbb70c8-2241-4bed-ab30-b4a38a5d0d1b', uuid_generate_v4(), 1),
('6dbb70c8-2241-4bed-ab30-b4a38a5d0d1b', uuid_generate_v4(), 12)
