CREATE SCHEMA IF NOT EXISTS UNS;
USE UNS;

-- Tabla Padre: Ocupación (de dónde proviene / qué estudia / dónde trabaja)
CREATE TABLE IF NOT EXISTS Ocupacion (
    id_ocupacion INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),   -- "Trabajo" o "Estudio"
    pais VARCHAR(50)
);

INSERT INTO Ocupacion (descripcion, tipo, pais) VALUES
('Ingeniero de Software', 'Trabajo', 'Perú'),
('Estudiante de Sistemas', 'Estudio', 'Colombia'),
('Analista de Datos', 'Trabajo', 'México'),
('Diseñador Gráfico', 'Trabajo', 'Argentina'),
('Estudiante de Medicina', 'Estudio', 'Chile');

-- Tabla Hija: Persona (datos personales)
CREATE TABLE IF NOT EXISTS Persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    edad INT GENERATED ALWAYS AS (YEAR(CURDATE()) - YEAR(fecha_nacimiento)) STORED, -- Atributo calculado
    correos VARCHAR(150), -- Atributo multivalorado
    id_ocupacion INT,
    FOREIGN KEY (id_ocupacion) REFERENCES Ocupacion(id_ocupacion)
);

INSERT INTO Persona (nombre, fecha_nacimiento, correos, id_ocupacion) VALUES
('Carlos Ruiz', '1990-06-15', 'carlos.ruiz@gmail.com,carlos.r@gmail.com', 1),
('Lucía Torres', '1995-08-10', 'lucia.torres@gmail.com', 2),
('Miguel García', '1988-12-25', 'miguel.garcia@gmail.com,miguelg@outlook.com', 3),
('Sofía Herrera', '1999-03-01', 'sofia.h@gmail.com', 4),
('Andrés López', '1992-01-20', 'andres.lopez@gmail.com,andres@live.com', 5);
