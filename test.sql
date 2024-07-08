CREATE TABLE invitados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    quimico INTEGER NOT NULL,
    llevaraNiños BOOLEAN NOT NULL,
    createdAt TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    FOREIGN KEY (quimico) REFERENCES quimicos(id) ON DELETE RESTRICT
);


CREATE TABLE niños (
    id SERIAL PRIMARY KEY,
    edad INTEGER NOT NULL,
    invitado INTEGER NOT NULL,
    FOREIGN KEY (invitado) REFERENCES invitados(id) ON DELETE RESTRICT
);



