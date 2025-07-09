-- Crear base de datos
CREATE DATABASE IF NOT EXISTS uns DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE uns;

-- Tabla Origen
CREATE TABLE IF NOT EXISTS Origen (
    id_origen INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

INSERT INTO Origen (descripcion) VALUES
('Perú'),
('Colombia'),
('Argentina'),
('México'),
('España');

-- Tabla Persona
CREATE TABLE IF NOT EXISTS Persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    hijos INT DEFAULT 0,
    correo VARCHAR(100),
    fecha_nacimiento DATE,
    id_origen INT,
    telefonos VARCHAR(100),
    FOREIGN KEY (id_origen) REFERENCES Origen(id_origen)
);

INSERT INTO Persona (nombre, hijos, correo, fecha_nacimiento, id_origen, telefonos) VALUES
('Luis Romero', 2, 'luis.romero@gmail.com', '1990-05-12', 1, '987654321, 912345678'),
('Ana Perez', 1, 'ana.perez@gmail.com', '1995-03-08', 2, '943212345'),
('Carlos Mendoza', 3, 'carlos.mendoza@gmail.com', '1985-11-21', 3, '981234567, 986543210'),
('María López', 0, 'maria.lopez@gmail.com', '1999-07-18', 4, '934567890'),
('Juan Castro', 2, 'juan.castro@gmail.com', '1992-01-15', 5, '976543210, 911223344');
