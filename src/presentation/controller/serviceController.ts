import { Request, Response } from "express";
import { CreateServiceCommand } from "../../app/command/createServiceCommand";
import { UpdateServiceCommand } from "../../app/command/updateServiceCommand";
import { GetAllServicesQuery } from "../../app/query/getAllServicesQuery";
import { FirestoreServiceRepository } from "../../infrastructure/persistence/firestore/repository/firestoreServiceRepository";

export class ServiceController {
    // TODO: Refazer com IoC Containers

    public async getAll(req: Request, res: Response): Promise<Response> {
        const repositoryService = new FirestoreServiceRepository();
        const query = new GetAllServicesQuery(repositoryService);
        const services = await query.execute();
        return res.json(services);
    }

    public async getById(req: Request, res: Response): Promise<Response> {
        const repositoryService = new FirestoreServiceRepository();
        const service = await repositoryService.getServiceById(req.params.id);
        return res.json(service);
    }
    
    public async create(req: Request, res: Response) {
        
        const repositoryService = new FirestoreServiceRepository();
        const command = new CreateServiceCommand(repositoryService);
        const service = await command.execute(req.body);
        return res.json(service);
    }

    public async update(req: Request, res: Response) {
        const repositoryService = new FirestoreServiceRepository();
        const command = new UpdateServiceCommand(repositoryService);
        const service = await command.execute(req.body);
        return res.json(service);

    }

    public async updateStatus(req: Request, res: Response) {
        const repositoryService = new FirestoreServiceRepository();
        const service = await repositoryService.updateServiceStatus(req.params.id, req.body.status);
        return res.json(service);
    }

    public async updateComment(req: Request, res: Response) {
        const repositoryService = new FirestoreServiceRepository();
        return res.json(await repositoryService.updateServiceComment(req.params.id, req.body.comment));
    }

    public async delete(req: Request, res: Response) {
        const repositoryService = new FirestoreServiceRepository();
        return res.json(await repositoryService.deleteService(req.params.id));
    }
    
}