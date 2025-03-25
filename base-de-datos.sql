CREATE TABLE Artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE Albumes (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_artista INT,
    anio INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_album INT,
    duracion INT NOT NULL, -- en segundos
    FOREIGN KEY (id_album) REFERENCES Albumes(id_album) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE Reproducciones (
    id_reproduccion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_cancion INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_cancion) REFERENCES Canciones(id_cancion) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Artistas (nombre, pais) VALUES
('Coldplay', 'Reino Unido'),
('Imagine Dragons', 'Estados Unidos'),
('Adele', 'Reino Unido');

INSERT INTO Albumes (titulo, id_artista, anio) VALUES
('Parachutes', 1, 2000),
('Evolve', 2, 2017),
('30', 3, 2021);

INSERT INTO Canciones (titulo, id_album, duracion) VALUES
('Yellow', 1, 267),
('Believer', 2, 204),
('Easy On Me', 3, 225);

INSERT INTO Usuarios (nombre, pais) VALUES
('Juan Perez', 'México'),
('Ana Gomez', 'Colombia'),
('Emily Smith', 'Estados Unidos');

INSERT INTO Reproducciones (id_usuario, id_cancion) VALUES
(1, 1), (1, 2), (2, 3), (3, 1), (3, 3), (2, 1);

select * from Reproducciones;

-- 1 
CREATE VIEW Vista_Albumes_por_Artista AS
SELECT 
    (SELECT nombre FROM Artistas WHERE id_artista = al.id_artista) AS nombre_artista,
    al.titulo AS titulo_album,
    al.anio AS anio_lanzamiento
FROM 
    Albumes al;
    
 select * from Vista_Albumes_por_Artista;