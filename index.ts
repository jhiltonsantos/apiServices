import express, { application } from "express";
import "./src/infrastructure/persistence/firestore";
import routes from "./src/presentation/routes/servicesRoutes";

const app = express();

app.use(express.json());
app.use(routes);

app.listen(3000, () => {
    console.log("Running on 3000...");
});
