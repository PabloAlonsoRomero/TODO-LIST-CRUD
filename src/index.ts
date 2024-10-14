import express from "express";
import { dbConnection } from "./db/init";

const app = express();

app.use(express.json());
dbConnection();

app.listen(3000, () => {
    console.log("Aplicacion corriendo en el puerto 3000")
})