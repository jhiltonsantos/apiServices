import { db } from "..";
import { iServiceRepository } from "../../../../app/repository/iServiceRepository";
import { Service } from "../../../../domain/entity/service";

export class FirestoreServiceRepository implements iServiceRepository{
    
    // TODO: implementar os metodos do firebase para atualizar, atualizar o status e o comentario, e deletar
    
    public async allServices(): Promise<Service[]> {
        const serviceRef = await db.collection('services').get();
        const services = serviceRef.docs.map(doc => ({id: doc.id, ...doc.data()}));
        return services as Service[];
    }

    public async getServiceById(id: number): Promise<Service> {
        const serviceRef = db.collection('services').doc(id.toString());
        const service = (await serviceRef.get()).data();
        return service as Service;
    }


    public async createService(service: Service): Promise<Service> {
        const {title, description, value, date_register, deadline, status, comment} = service;
        const serviceRef = await db.collection('services').add({title, description, value, date_register, deadline, status, comment});
        const serviceId = serviceRef.id;
        return {id: serviceId, title, description, value, date_register, deadline, status, comment} as Service;
    }

    updateService(service: Service): Promise<Service> {
        throw new Error("Method not implemented.");
    }
    updateServiceStatus(id: number, status: string): Promise<Service> {
        throw new Error("Method not implemented.");
    }
    updateServiceComment(id: number, comment: string): Promise<Service> {
        throw new Error("Method not implemented.");
    }
    deleteService(id: number): Promise<Service> {
        throw new Error("Method not implemented.");
    }
}