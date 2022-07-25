CREATE DATABASE market;

-- create a table

CREATE TABLE Category
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(150) NOT NULL
);


CREATE TABLE Category__Product
(
  category_id INT NOT NULL,
  product_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES Category(id),
  FOREIGN KEY (product_id) REFERENCES Product(id) 
);

  
CREATE TABLE Product
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  category_id INT NOT NULL,
  product_image_main_id INT NOT NULL,  
  name VARCHAR(30) NOT NULL,
  price_old DECIMAL(10, 2) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  price_discount DECIMAL(10, 2) NOT NULL,
  description VARCHAR(150) NOT NULL,
  active boolean NOT NULL,
  FOREIGN KEY (category_id) REFERENCES Category(id),
  FOREIGN KEY (product_image_main_id) REFERENCES Product_Image(id)    
);


CREATE TABLE Product__Product_image
(
  product_id INT NOT NULL,
  product_image_id INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES Product(id), 
  FOREIGN KEY (product_image_id) REFERENCES Product_Image(id) 
);


CREATE TABLE Product_Image
(
  id INT PRIMARY KEY AUTO_INCREMENT,  
  image CHAR(30),  
  alt_image VARCHAR(30) NOT NULL  
);

-- insert into table

INSERT INTO Category
            (
            ID,
            name,
            description
            )
        VALUES            
            (1,'Мужская','Одежда для мужчин с головы до пят'),
            (2,'Женская','Одежда для женщин с головы до пят'),
            (3,'Головные уборы','описание головных уборов'),
            (4,'Верхняя одежда','описание верхней одежды'),
            (5,'Обувь','описание обуви'),
            (6,'Аксессуары','описание аксессуаров'),
            (7,'Кроссовки','описание Кроссовки'),
            (8,'Рубашки','описание Рубашки'),
            (9,'Браслеты','описание Браслет');

INSERT INTO Category__Product
            (
            category_id,
            product_id
            )
        VALUES            
            (1,2),
            (1,3),
            (1,4),
            (2,1),
            (2,5),
            (2,6),
            (2,7),
            (3,1),
            (3,4),
            (4,3),
            (4,5),
            (5,2),
            (6,6),
            (6,7),
            (7,2),
            (8,3),
            (8,5),
            (9,6),
            (9,7);

INSERT INTO Product
            (
            Id,
            category_id,            
            product_image_main_id,           
            name,
            price_old,
            price,
            price_discount,
            description,
            active
            )
        VALUES
            (1, 3, 1,'Snow Protector', 1200, 1100, 1050, 'Snow Protector описание',1),
            (2, 5, 2,'Leomax+ tops', 3200, 3100, 3050, 'Leomax+ tops описание', 1),
            (3, 4, 3,'Гавайская', 2200, 2100, 2050, 'Гавайская описание', 1),
            (4, 3, 1,'Snow Protector Man', 1200, 1100, 1050, ' описание', 1),
            (5, 4, 4,'Рубашка Medecine', 2200, 2100, 2050, 'описание Рубашки Medecine', 1),
            (6, 6, 5,'Гвоздь', 82200, 71100, 60050, 'ГВОЗДИ описание', 1),
            (7, 6, 6,'Бугати', 11200, 10100, 10050, 'Бугати описание', 1);        
            
INSERT INTO Product__Product_image
            (
            product_id,
            product_image_id
            )
        VALUES            
            (1,1),
            (2,2),
            (3,3),
            (4,1),
            (4,7),
            (5,4),
            (6,5),
            (7,6);
            
INSERT INTO Product_Image
            (
            id,            
            image,
            alt_image
            )
        VALUES
            (1,'url-img1','alt-img1'),
            (2,'url-img2','alt-img2'),
            (3,'url-img3','alt-img3'),
            (4,'url-img4','alt-img4'),
            (5,'url-img5','alt-img5'),
            (6,'url-img6','alt-img6'),
            (7,'url-img7','alt-img7');

  
              
