import { db } from "..";
import { iServiceRepository } from "../../../../app/repository/iServiceRepository";
import { Service } from "../../../../domain/entity/service";

export class FirestoreServiceRepository implements iServiceRepository{
    
    public async allServices(): Promise<Service[]> {
        const serviceRef = await db.collection('services').get();
        const services = serviceRef.docs.map(doc => ({id: doc.id, ...doc.data()}));
        return services as Service[];
    }

    public async getServiceById(id: string): Promise<Service> {
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

    public async updateService(service: Service): Promise<Service> {
        const {id, title, description, value, date_register, deadline, status, comment} = service;
        await db.collection('services').doc(id.toString()).update({title, description, value, date_register, deadline, status, comment});
        return service as Service;
    }

    public async updateServiceStatus(id: string, status: string): Promise<Service> {
        await db.collection('services').doc(id.toString()).update({status});
        return {id, status} as Service;
    }

    public async updateServiceComment(id: string, comment: string): Promise<Service> {
        await db.collection('services').doc(id).update({comment});
        return {id, comment} as Service;
    }

    public async deleteService(id: string): Promise<Service> {
        await db.collection('services').doc(id).delete();
        return {id} as Service;
    }
}