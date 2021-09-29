import { Service } from "../../domain/entity/service";

export interface iServiceRepository {
    allServices(): Promise<Service[]>;
    getServiceById(id: number): Promise<Service>;
    createService(service: Service): Promise<Service>;
    updateService(service: Service): Promise<Service>;
    updateServiceStatus(id: number, status: string): Promise<Service>;
    updateServiceComment(id: number, comment: string): Promise<Service>;
    deleteService(id: number): Promise<Service>;
}

// INTERFACE FINALIZADA