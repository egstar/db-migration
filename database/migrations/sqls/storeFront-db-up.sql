CREATE TABLE IF NOT EXISTS users ( 
  id serial PRIMARY KEY,
  uLevel VARCHAR(10),
  uName VARCHAR(50) UNIQUE NOT NULL,
  fName VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  passwd VARCHAR(50) NOT NULL,
  uStats VARCHAR(50) NOT NULL
  );
CREATE TABLE IF NOT EXISTS cats ( 
  id serial PRIMARY KEY,
  catName VARCHAR(50) UNIQUE NOT NULL,
  catType VARCHAR(50) NOT NULL
  );
CREATE TABLE IF NOT EXISTS products ( 
  id serial PRIMARY KEY,
  pName VARCHAR(50) UNIQUE NOT NULL,
  pImg VARCHAR(255) NOT NULL,
  pPrice VARCHAR(50) NOT NULL,
  pStats VARCHAR(50) NOT NULL,
  catId INT NOT NULL,
  FOREIGN KEY (catId) REFERENCES cats (id)
  );
CREATE TABLE IF NOT EXISTS orders ( 
  id serial PRIMARY KEY,
  userId INT NOT NULL,
  oStats VARCHAR(50) NOT NULL,
  oTotal INT NOT NULL,
  payMethod VARCHAR(50) NOT NULL,
  FOREIGN KEY (userId) REFERENCES users (id)
  );
CREATE TABLE IF NOT EXISTS order_stats (
  orderId INT NOT NULL,
  prodId INT NOT NULL,
  Qnty INT NOT NULL,
  FOREIGN KEY (orderId) REFERENCES orders (id),
  FOREIGN KEY (prodId) REFERENCES products (id)
  );
