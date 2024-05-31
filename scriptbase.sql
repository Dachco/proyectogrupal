--Crear la base de datos
CREATE DATABASE ProyectoTienda;
USE ProyectoTienda;

-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100)  NULL,
    Contrasena VARCHAR(255) NOT NULL,
    Telefono VARCHAR(15),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Email, Contrasena, Telefono)
VALUES 
    ('Paula Botia', 'Paula.Botia@example.com', '1234567','555-1234'),
    ('David Chang', 'David.Chang@example.com', '1234567', '555-5678'),
	('Andres Fonseca', 'Andres.Fonseca@example.com', '1234567','555-1235'),
    ('Andres Rivera', 'Andres.Rivera@example.com', '1234567', '555-5679');

select * from Usuarios

-- Crear tabla Categorias
CREATE TABLE Categorias (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(MAX)
);

-- Insertar datos en la tabla Categorias
INSERT INTO Categorias (Nombre, Descripcion)
VALUES 
    ('Camisetas F', 'Camisetas para mujeres'),
    ('Camisetas M', 'Camisetas para hombres'),
	('Joogers F', 'Joogers para mujeres'),
    ('Joogers M', 'Joogers para hombres');

select * from Categorias

-- Crear tabla Productos
CREATE TABLE Productos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Detalle VARCHAR(MAX),
    Precio DECIMAL(10, 2) NOT NULL,
    IdCategoria INT,
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(Id)
);

INSERT INTO Productos (Nombre, Detalle, Precio, IdCategoria)
VALUES 
    ('Camiseta F 1', 'Camiseta F 1, 100% algodón.', 40.00, 1),
    ('Camiseta F 2', 'Camiseta F 2, material suave y cómodo.', 45.00, 1),
    ('Camiseta F 3', 'Camiseta F 3, material más grueso.', 45.00, 1),
    ('Camiseta F 4', 'Camiseta F 4, material más fresco.', 55.00, 1),
    ('Camiseta F 5', 'Camiseta F 5, material cómodo.', 40.00, 1),
    ('Camiseta F 6', 'Camiseta F 6, material liviano.', 60.00, 1),
    ('Camiseta F 7', 'Camiseta F 7, 100% algodón.', 49.00, 1),
	('Camiseta F 8', 'Camiseta F 8, 100% algodón.', 60.00, 1),
	('Camiseta F 9', 'Camiseta F 9, 100% algodón.', 58.00, 1),
	('Camiseta F 10', 'Camiseta F 10, 100% algodón.', 42.00, 1),
    ('Camiseta M 1', 'Camiseta M 1, 100% algodón.', 40.00, 2),
    ('Camiseta M 2', 'Camiseta M 2, material suave y cómodo.', 45.00, 2),
    ('Camiseta M 3', 'Camiseta M 3, material más grueso.', 45.00, 2),
    ('Camiseta M 4', 'Camiseta M 4, material más fresco.', 55.00, 2),
    ('Camiseta M 5', 'Camiseta M 5, material cómodo.', 40.00, 2),
    ('Camiseta M 6', 'Camiseta M 6, material liviano.', 60.00, 2),
    ('Camiseta M 7', 'Camiseta M 7, 100% algodón.', 40.00, 2),
    ('Camiseta M 8', 'Camiseta M 8, material más grueso.', 40.00, 2),
    ('Camiseta M 9', 'Camiseta M 9, material suave y cómodo.', 45.00, 2),
    ('Camiseta M 10', 'Camiseta M 10, material más fresco.', 45.00, 2),
	('Jooger F 1', 'Jooger F 1, 100% algodón.', 40.00, 3),
    ('Jooger F 2', 'Jooger F 2, material suave y cómodo.', 45.00, 3),
    ('Jooger F 3', 'Jooger F 3, material más grueso.', 45.00, 3),
    ('Jooger F 4', 'Jooger F 4, material más fresco.', 55.00, 3),
    ('Jooger F 5', 'Jooger F 5, material cómodo.', 40.00, 3),
    ('Jooger F 6', 'Jooger F 6, material liviano.', 60.00, 3),
    ('Jooger F 7', 'Jooger F 7, 100% algodón.', 49.00, 3),
	('Jooger F 8', 'Jooger F 8, 100% algodón.', 60.00, 3),
	('Jooger F 9', 'Jooger F 9, 100% algodón.', 58.00, 3),
	('Jooger F 10', 'Jooger F 10, 100% algodón.', 42.00, 3),
    ('Jooger M 1', 'Jooger M 1, 100% algodón.', 40.00, 4),
    ('Jooger M 2', 'Jooger M 2, material suave y cómodo.', 45.00, 4),
    ('Jooger M 3', 'Jooger M 3, material más grueso.', 45.00, 4),
    ('Jooger M 4', 'Jooger M 4, material más fresco.', 55.00, 4),
    ('Jooger M 5', 'Jooger M 5, material cómodo.', 40.00, 4),
    ('Jooger M 6', 'Jooger M 6, material liviano.', 60.00, 4),
    ('Jooger M 7', 'Jooger M 7, 100% algodón.', 40.00, 4),
    ('Jooger M 8', 'Jooger M 8, material más grueso.', 40.00, 4),
    ('Jooger M 9', 'Jooger M 9, material suave y cómodo.', 45.00, 4),
    ('Jooger M 10', 'Jooger M 10, material más fresco.', 45.00, 4);

select * from Productos

-- Crear tabla ImagenesProductos
CREATE TABLE ImagenesProductos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdProducto INT,
    ImagenUrl NVARCHAR(MAX),
    FOREIGN KEY (IdProducto) REFERENCES Productos(Id)
);


-- Insertar datos en la tabla ImagenesProductos
INSERT INTO ImagenesProductos (IdProducto, ImagenUrl)
VALUES 
    (1, 'https://starkbrand.com.co/cdn/shop/files/9E7EF048-29CD-47AC-A813-3A33581AF652.jpg?v=1710417348&width=1125'),
    (2, 'https://starkbrand.com.co/cdn/shop/files/C07A5E8B-5CAD-455C-BE22-2AADF99C22EF.jpg?v=1710417193&width=1125'),
    (3, 'https://starkbrand.com.co/cdn/shop/files/3E9315BB-5D87-4BBF-BDDD-5724F5708EEF.jpg?v=1710000521&width=1125'),
    (3, 'https://starkbrand.com.co/cdn/shop/files/B4AE3185-B5A8-42E0-904E-D8CFDEBAE9E6.jpg?v=1710000521&width=1125'),
    (4, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-13at12.07.52PM.jpg?v=1710357769&width=1125'),
    (4, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-13at12.07.52PM_1.jpg?v=1710357769&width=1125'),
    (5, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-12at8.55.21AM_3.jpg?v=1710279945&width=1125'),
    (5, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-12at8.55.21AM_2.jpg?v=1710279945&width=1125'),
	(6, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-09at10.56.59AM.jpg?v=1710190270&width=1125'),
    (6, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-09at10.56.59AM_2.jpg?v=1710190270&width=1125'),
    (7, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-11at12.02.09PM_1.jpg?v=1710189848&width=1125'),
    (7, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-11at12.02.09PM.jpg?v=1710189848&width=1125'),
    (8, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-13at11.20.41AM.jpg?v=1710357717&width=1125'),
    (8, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-13at11.20.40AM.jpg?v=1710357716&width=1125'),
    (9, 'https://starkbrand.com.co/cdn/shop/files/F044F973-FEFC-4F91-9E90-640403BADF86.jpg?v=1710417287&width=1125'),
    (9, 'https://starkbrand.com.co/cdn/shop/files/81B24517-6CCB-48CD-835B-353BD646942F.jpg?v=1710417286&width=1125'),
    (10, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-03-05at3.30.32PM_2.jpg?v=1709758347&width=1125'),
    (11, 'https://starkbrand.com.co/cdn/shop/files/C50.jpg?v=1716919171&width=160'),
    (11, 'https://starkbrand.com.co/cdn/shop/files/C51.jpg?v=1716924306&width=1125'),
    (12, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-05-16at8.43.01AM.jpg?v=1715870298&width=1125'),
    (13, 'https://starkbrand.com.co/cdn/shop/products/WhatsAppImage2022-10-03at12.57.16PM.jpg?v=1664830535&width=1125'),
    (13, 'https://starkbrand.com.co/cdn/shop/products/WhatsAppImage2022-10-03at12.50.51PM.jpg?v=1664830535&width=1125'),
    (14, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-05-23at3.35.02PM_1.jpg?v=1716497342&width=1125'),
	(14, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-05-23at3.35.02PM.jpg?v=1716497341&width=1500'),
    (15, 'https://starkbrand.com.co/cdn/shop/files/E3925375.jpg?v=1712677390&width=1125'),
    (15, 'https://starkbrand.com.co/cdn/shop/files/E3925374.jpg?v=1712677390&width=1125'),
    (16, 'https://starkbrand.com.co/cdn/shop/files/A44.jpg?v=1716393145&width=1125'),
    (16, 'https://starkbrand.com.co/cdn/shop/files/C47.jpg?v=1716393160&width=1500'),
    (17, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-05-28at10.23.10AM.jpg?v=1716910554&width=1125'),
    (17, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-05-28at10.23.09AM.jpg?v=1716910554&width=1125'),
	(18, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-05-28at10.46.40AM.jpg?v=1716911284&width=1125'),
    (18, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-05-28at10.32.12AM_1.jpg?v=1716911284&width=1125'),
    (19, 'https://starkbrand.com.co/cdn/shop/files/A54.jpg?v=1717078270&width=1125'),
    (20, 'https://starkbrand.com.co/cdn/shop/files/A53.jpg?v=1716916374&width=1125'),
	(21, 'https://invictowear.com/cdn/shop/files/IMG_5650.jpg?v=1706046930&width=713'),
    (22, 'https://invictowear.com/cdn/shop/files/IMG_5477.jpg?v=1706046930&width=713'),
    (23, 'https://invictowear.com/cdn/shop/files/IMG_5595.jpg?v=1706046930&width=713'),
    (24, 'https://invictowear.com/cdn/shop/files/IMG_5612.jpg?v=1706046930&width=713'),
    (25, 'https://invictowear.com/cdn/shop/files/IMG_5507.jpg?v=1706046930&width=713'),
	(26, 'https://invictowear.com/cdn/shop/files/INVICTO-153.jpg?v=1706041706&width=713'),
    (27, 'https://invictowear.com/cdn/shop/files/INVICTO-179.jpg?v=1706041707&width=713'),
    (28, 'https://static.pullandbear.net/2/photos//2024/V/0/1/p/3678/331/832/3678331832_2_7_0.jpg?imwidth=563&ts=1709209444789'),
    (29, 'https://static.pullandbear.net/2/photos//2024/I/0/1/p/7678/317/520/7678317520_2_10_0.jpg?imwidth=563&ts=1715250781834'),
    (30, 'https://static.pullandbear.net/2/photos//2024/I/0/1/p/3678/364/711/3678364711_4_1_0.jpg?imwidth=563&ts=1715677263198'),
    (31, 'https://starkbrand.com.co/cdn/shop/files/Z3.jpg?v=1712955625&width=1125'),
    (32, 'https://starkbrand.com.co/cdn/shop/files/9885C199-83CF-47FC-93FF-7899D7BAA17B.jpg?v=1712331525&width=1125'),
    (33, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-04-01at12.04.52PM.jpg?v=1711991296&width=1125'),
	(34, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-04-19at11.00.22AM.jpg?v=1713542787&width=800'),
    (35, 'https://starkbrand.com.co/cdn/shop/files/j11.jpg?v=1707412154&width=1125'),
    (36, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-04-19at10.28.21AM_1.jpg?v=1713542767&width=800'),
    (37, 'https://starkbrand.com.co/cdn/shop/files/j12.jpg?v=1707417472&width=1125'),
	(38, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-04-11at7.27.15PM.jpg?v=1712886152&width=1125'),
    (39, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2024-04-11at7.13.24PM.jpg?v=1712886509&width=800'),
    (40, 'https://starkbrand.com.co/cdn/shop/files/WhatsAppImage2023-05-08at5.12.19PM.jpg?v=1683584122&width=800');

select * from ImagenesProductos




