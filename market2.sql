CREATE DATABASE market;

-- create a table

CREATE TABLE Category
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(150) NOT NULL
);
  
CREATE TABLE Subcategory
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  category_id int,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(150) NOT NULL,
  FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE Product
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  category_id int,  
  subcategory_id int,  
  name VARCHAR(30) NOT NULL,
  description VARCHAR(150) NOT NULL,
  active boolean,
  FOREIGN KEY (category_id) REFERENCES Category(id),  
  FOREIGN KEY (subcategory_id) REFERENCES Subcategory(id),
  
);

CREATE TABLE Product_Image
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id int,
  image text,
  image_preview text,
  description VARCHAR(30) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Price
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id int,
  price_old int,
  price int,
  price_discount int,
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Product_page
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id int,

);

CREATE TABLE Product_preview_card
(
  id INT PRIMARY KEY AUTO_INCREMENT  
);


-- insert into table

INSERT INTO Category
            (
            ID,
            name,
            description
            )
        VALUES
            (1,'Зима','Одежда для зимы с головы до пят'),
            (2,'Весна','Одежда для весны с головы до пят'),
            (3,'Лето','Одежда для лета с головы до пят'),
            (4,'Осень','Одежда для осени с головы до пят'),
            (5,'Мужская','Одежда для мужчин с головы до пят'),
            (6,'Женская','Одежда для женщин с головы до пят'),
            (7,'Головные уборы','описание головных уборов'),
            (8,'Верхняя одежда','описание верхней одежды'),
            (9,'Обувь','описание обуви'),
            (10,'Аксессуары','описание аксессуаров');
            
            
INSERT INTO Subcategory
            (
            Id,
            category_id,
            name,
            description
            )
        VALUES
            (1, 3,'Кроссовки1','описание Кроссовки'),
            (2, 9,'Кроссовки2','описание Кроссовки'),
            (3, 5,'Кроссовки3','описание Кроссовки'),
            (4, 6,'Кроссовки4','описание Кроссовки'),
            (5, 3,'Рубашки1','описание Рубашки'),
            (6, 5,'Рубашки2','описание Рубашки'),
            (7, 6,'Рубашки3','описание Рубашки'),
            (8, 8,'Рубашки4','описание Рубашки'),
            (10, 1,'Шапки1','описание Шапки'),
            (11, 2,'Шапки2','описание Шапки'),
            (12, 3,'Шапки3','описание Шапки'),
            (13, 5,'Шапки4','описание Шапки'),
            (14, 6,'Шапки5','описание Шапки'),
            (15, 7,'Шапки6','описание Шапки'),
            (16, 6,'Браслеты1','описание Браслет'),
            (17, 10,'Браслеты2','описание Браслет');


INSERT INTO Product
            (
            Id,
            category_id,            
            subcategory_id,            
            name,
            description,
            active
            )
        VALUES
            (1, 1, 10,'Snow Protector','Snow Protector описание',1),
            (2, 3, 1,'Leomax+ tops','Leomax+ tops описание', 1),
            (3, 3, 5,'Гавайская','Гавайская описание', 1),
            (4, 5, 13,'Snow Protector Man',' описание', 1),
            (5, 6, 7,'Рубашка Medecine','описание Рубашкb Medecine', 1),
            (6, 6, 16,'Гвоздь','ГВОЗДИ описание', 1),
            (7, 10, 17,'Бугати','Бугати описание', 1);        
            
INSERT INTO Price
            (
            ID,
            product_id,
            price_old,
            price,
            price_discount
            )
        VALUES
            (1, 1, 1200, 1100, 1050),
            (2, 2, 900, 800, 750),
            (3, 3, 2500, 2400, 2350),
            (4, 4, 1200, 1100, 1050),
            (5, 5, 2500, 2400, 2350),
            (6, 6, 250, 230, 225),
            (7, 7, 90000, 75000, 60000);
            
INSERT INTO Product_Image
            (
            ID,
            product_id,
            image,
            image_preview,
            description
            )
        VALUES
            (1, 1,'url img1',' url img_preview1','img1'),
            (2, 2,'url img2',' url img_preview2','img2'),
            (3, 3,'url img3',' url img_preview3','img3'),
            (4, 4,'url img4',' url img_preview4','img4'),
            (5, 5,'url img5',' url img_preview5','img5'),
            (6, 6,'url img6',' url img_preview6','img6'),
            (7, 7,'url img7',' url img_preview7','img7');

INSERT INTO product_page
            (
             product_id   
            )            

-- product preview page
            
SELECT pp.id, p.id, p.name, pi.image_preview, pi.image,p.category_id, c.name as category_name, p.subcategory_id, s.name as subcategory_name, price_old, price, price_discount, p.description
FROM product_page pp, product p, product_image, category c, subcategory s, price, product_image pi

-- product preview card

SELECT ppc.id, p.id, p.category_id, c.name as category_name, p.name, pi.image_preview, pi.description, active
FROM product_preview_card ppc, product p, product_image, category c, product_image pi
