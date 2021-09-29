import { Router, Request, Response } from "express";
import { db } from "../../infrastructure/persistence/firestore";
import { ServiceController } from "../controller/serviceController";

const router = Router();

const serviceController = new ServiceController();

router.get('/services',  serviceController.getAll);
router.get('/services/:id', serviceController.getById);
router.post('/services', serviceController.create);
router.put('/services/update/:id', serviceController.update);
router.put('/services/status/:id', serviceController.updateStatus);
router.put('/services/comment/:id', serviceController.updateComment);
router.delete('/services/:id', serviceController.delete);

export default router;

// ROTAS FINALIZADAS