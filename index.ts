import express, { application } from "express";
import cors from "cors";
import "./src/infrastructure/persistence/firestore";
import routes from "./src/presentation/routes/servicesRoutes";


const app = express();

app.use(cors());
app.use(express.json());
app.use(routes);

app.listen(3000, () => {
    console.log("Running on 3000...");
});
