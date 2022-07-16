/* INSERT QUERIES */
INSERT INTO roles (roleName) VALUES ('Admin');
INSERT INTO roles (roleName) VALUES ('User');
INSERT INTO cats VALUES ('Default category', 'For non categorized products');
INSERT INTO cats VALUES ('Main category', 'Have sub-categories inside');
INSERT INTO sub_cats VALUES (1,'First Sub', 2);
INSERT INTO sub_cats VALUES (1,'Second Sub', 2);
INSERT INTO payment_categories (catName) VALUES ('Cash payments');
INSERT INTO payment_categories (catName) VALUES ('Online payments');
INSERT INTO payment_categories (catName) VALUES ('Crypto payments');
INSERT INTO payment_methods (methodName,payCat) VALUES ('Cash on delivery', 1);
INSERT INTO payment_methods (methodName,payCat) VALUES ('Wire transfer', 1);
INSERT INTO payment_methods (methodName,payCat) VALUES ('Bank transfer', 1);
INSERT INTO payment_methods (methodName,payCat) VALUES ('Visa card', 2);
INSERT INTO payment_methods (methodName,payCat) VALUES ('Master card', 2);
INSERT INTO payment_methods (methodName,payCat) VALUES ('American express', 2);
INSERT INTO payment_methods (methodName,payCat) VALUES ('Paypal', 2);
INSERT INTO payment_methods (methodName,payCat) VALUES ('Payoneer', 2);
INSERT INTO payment_methods (methodName,payCat) VALUES ('Etherum', 3);
INSERT INTO payment_methods (methodName,payCat) VALUES ('Bitcoin', 3);
INSERT INTO users VALUES (1,'User1','User1@burhams.com','First','User','$2y$10$gi/XSmHfrglhyLHmXfsUvOyXif7ha8auOCQxu5FLOu62A16bbUBd2'); 
/* pass: h4sh3dp4ssw0rd */
/* PASSWORD HASHED USING BCRYPT & BCRYPT_PASSWORD=34syp4ssw0rd ( AT THE ENV FILE ) */
INSERT INTO users VALUES (2,'User2','User2@burhams.com','Second','User','$2y$10$gi/XSmHfrglhyLHmXfsUvOyXif7ha8auOCQxu5FLOu62A16bbUBd2');
INSERT INTO users VALUES (3,'User3','User3@burhams.com','Third','User','$2y$10$gi/XSmHfrglhyLHmXfsUvOyXif7ha8auOCQxu5FLOu62A16bbUBd2');
INSERT INTO user_roles VALUES (1,1); /* SET ADMIN ROLE */
INSERT INTO user_roles VALUES (2,2);

/* SELECT QUERIES */
SELECT userid,rolename,uname,fname,lname,email FROM users INNER JOIN user_roles ON userid=users.id INNER JOIN roles ON roleid=roles.id;
SELECT * FROM sub_cats WHERE catid=2;
SELECT methodname FROM payment_methods WHERE paycat=2 LIMIT 3 ORDER BY DESC;

/* UPDATE QUERIES */
UPDATE user_roles SET roleid=1 WHERE userid=2;
UPDATE cats SET catname='NEW CATEGORY NAME' WHERE id=2;

/* DELETE QUERIES */
DELETE FROM sub_cats WHERE subname='Second Sub';
DELETE FROM users WHERE id=3;
