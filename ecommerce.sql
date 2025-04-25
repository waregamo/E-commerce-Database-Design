
CREATE DATABASE  IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE IF NOT EXISTS brand (
    brandId INT AUTO_INCREMENT PRIMARY KEY,
    brandName VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS productCategory (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS product (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(255) NOT NULL,
    brandId INT,
    categoryId INT,
    basePrice DECIMAL(10, 2),
    FOREIGN KEY (brandId) REFERENCES brand(brandId),
    FOREIGN KEY (categoryId) REFERENCES productCategory(categoryId)
);

CREATE TABLE IF NOT EXISTS productImage (
    imageId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT,
    imageUrl TEXT NOT NULL,
    FOREIGN KEY (productId) REFERENCES product(productId)
);


CREATE TABLE IF NOT EXISTS color (
    colorId INT AUTO_INCREMENT PRIMARY KEY,
    colorName VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS sizeCategory (
    sizeCategoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS sizeOption (
    sizeOptionId INT AUTO_INCREMENT PRIMARY KEY,
    sizeCategoryId INT,
    sizeName VARCHAR(50) NOT NULL,
    FOREIGN KEY (sizeCategoryId) REFERENCES sizeCategory(sizeCategoryId)
);


CREATE TABLE IF NOT EXISTS productVariation (
    variationId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT,
    colorId INT,
    sizeOptionId INT,
    FOREIGN KEY (productId) REFERENCES product(productId),
    FOREIGN KEY (colorId) REFERENCES color(colorId),
    FOREIGN KEY (sizeOptionId) REFERENCES sizeOption(sizeOptionId)
);


CREATE TABLE IF NOT EXISTS productAttribute (
    attributeId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT,
    attributeTypeId INT,
    AttributeValue VARCHAR(255),
    FOREIGN KEY (productId) REFERENCES product(productId)
);


CREATE TABLE IF NOT EXISTS AttributeCategory (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS attributeType (
    typeId INT AUTO_INCREMENT PRIMARY KEY,
    categoryId INT,
    typeName VARCHAR(255) NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES attributeCategory(categoryId)
);


CREATE TABLE IF NOT EXISTS productItem (
    itemId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT,
    variationId INT,
    stockQuantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (productId) REFERENCES product(productId),
    FOREIGN KEY (variationId) REFERENCES productVariation(variationId)
);
