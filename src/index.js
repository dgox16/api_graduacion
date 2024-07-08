import express from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
const app = express();
const port = 3000;
app.use(express.json());

app.post("/", async (req, res) => {
	const { nombre, apellidos, quimico, llevaraNiños, niños } = req.body;

	try {
		const nuevoInvitado = await prisma.invitados.create({
			data: {
				nombre,
				apellidos,
				quimico: parseInt(quimico),
				llevarani_os: llevaraNiños,
				ni_os: {
					create: niños.map((niño) => ({
						edad: niño.edad,
					})),
				},
			},
			include: {
				ni_os: true,
			},
		});

		console.info("Nuevo invitado:", nuevoInvitado);
		res.json(nuevoInvitado);
	} catch (error) {
		console.error("Error al insertar datos:", error);
		res.status(500).json({ error: "Error al insertar datos" });
	}
});

app.listen(port, () => {
	console.log(`Example app listening at http://localhost:${port}`);
});
