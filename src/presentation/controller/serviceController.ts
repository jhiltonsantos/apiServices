import { Request, Response } from "express";
import { CreateServiceCommand } from "../../app/command/createServiceCommand";
import { GetAllServicesQuery } from "../../app/query/getAllServicesQuery";
import { FirestoreServiceRepository } from "../../infrastructure/persistence/firestore/repository/firestoreServiceRepository";

export class ServiceController {
    // TODO: Implementar Services Controller de atualizar, atualizar status e atualizar comentário, e deletar

    public async getAll(req: Request, res: Response): Promise<Response> {
        const repositoryService = new FirestoreServiceRepository();
        const query = new GetAllServicesQuery(repositoryService);
        const services = await query.execute();
        return res.json(services);
    }

    public async getById(req: Request, res: Response): Promise<Response> {
        return res.json(req.params.id);
    }
    
    public async create(req: Request, res: Response) {
        // Refazer com IoC Containers
        const repositoryService = new FirestoreServiceRepository();
        const query = new CreateServiceCommand(repositoryService);
        const service = await query.execute(req.body);
        return res.json(service);
    }

    public async update(req: Request, res: Response) {
        return res.json(req.params.id);
    }

    public async updateStatus(req: Request, res: Response) {
        return res.json(req.params.id);
    }

    public async updateComment(req: Request, res: Response) {
        return res.json(req.params.id);
    }

    public async delete(req: Request, res: Response) {
        return res.json(req.params.id);
    }

    




    
}