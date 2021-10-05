import { Service } from "../../domain/entity/service";

export interface iServiceRepository {
    allServices(): Promise<Service[]>;
    getServiceById(id: string): Promise<Service>;
    createService(service: Service): Promise<Service>;
    updateService(service: Service): Promise<Service>;
    updateServiceStatus(id: string, status: string): Promise<Service>;
    updateServiceComment(id: string, comment: string): Promise<Service>;
    deleteService(id: string): Promise<Service>;
}

// INTERFACE FINALIZADA