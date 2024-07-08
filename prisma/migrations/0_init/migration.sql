-- CreateTable
CREATE TABLE "invitados" (
    "id" SERIAL NOT NULL,
    "nombre" VARCHAR(80) NOT NULL,
    "apellidos" VARCHAR(80) NOT NULL,
    "quimico" INTEGER NOT NULL,
    "llevaraniños" BOOLEAN NOT NULL,
    "createdat" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "invitados_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "niños" (
    "id" SERIAL NOT NULL,
    "edad" INTEGER NOT NULL,
    "invitado" INTEGER NOT NULL,

    CONSTRAINT "niños_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quimicos" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT,

    CONSTRAINT "quimicos_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "invitados" ADD CONSTRAINT "invitados_quimico_fkey" FOREIGN KEY ("quimico") REFERENCES "quimicos"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "niños" ADD CONSTRAINT "niños_invitado_fkey" FOREIGN KEY ("invitado") REFERENCES "invitados"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

