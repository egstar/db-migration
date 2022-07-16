/* Replace with your SQL commands */
CREATE TABLE IF NOT EXISTS users ( 
  id serial PRIMARY KEY,
  uName VARCHAR(50) UNIQUE NOT NULL,
  email varchar(50) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  passwd VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS roles (
  id serial PRIMARY KEY,
  roleName VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS user_roles(
  userId INT Unique NOT NULL,
  roleId INT NOT NULL,
  FOREIGN KEY (userId) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (roleId) REFERENCES roles (id) 
);
CREATE TABLE IF NOT EXISTS cats ( 
  id serial PRIMARY KEY,
  catName VARCHAR(50) UNIQUE NOT NULL,
  catType TEXT
);
CREATE TABLE IF NOT EXISTS sub_cats(
id serial PRIMARY KEY,
subName VARCHAR(50) NOT NULL,
catId INT NOT NULL,
FOREIGN KEY  (catId) REFERENCES cats(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS products ( 
  id serial PRIMARY KEY,
  pName VARCHAR(50) UNIQUE NOT NULL,
  pImg VARCHAR(255) NOT NULL,
  pPrice VARCHAR(50) NOT NULL,
  pStats VARCHAR(50) NOT NULL,
  catId INT NOT NULL,
  subCat INT,
  FOREIGN KEY (catId) REFERENCES cats (id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS payment_categories (
  id SERIAL PRIMARY KEY,
  catName VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS payment_methods (
  id serial PRIMARY KEY,
  methodName VARCHAR(100) UNIQUE NOT NULL,
  payCat INT,
  FOREIGN KEY (payCat) REFERENCES payment_categories (id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS orders ( 
  id serial PRIMARY KEY,
  userId INT NOT NULL,
  oStats VARCHAR(50) NOT NULL,
  oTotal INT NOT NULL,
  payMethod INT NOT NULL,
  FOREIGN KEY (userId) REFERENCES users (id) ON DELETE CASCADE, 
  FOREIGN KEY (payMethod) REFERENCES payment_methods (id)
);
CREATE TABLE IF NOT EXISTS order_stats (
  orderId INT NOT NULL,
  prodId INT NOT NULL,
  Qnty INT NOT NULL,
  itemStats VARCHAR(100),
  FOREIGN KEY (orderId) REFERENCES orders (id) ON DELETE CASCADE,
  FOREIGN KEY (prodId) REFERENCES products (id) ON DELETE CASCADE
);
