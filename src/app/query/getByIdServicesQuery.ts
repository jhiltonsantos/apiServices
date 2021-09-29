import { Service } from "../../domain/entity/service";
import { iServiceRepository } from "../repository/iServiceRepository";

export class GetByIdServicesQuery {
    private serviceRepository: iServiceRepository;

    constructor(serviceRepository: iServiceRepository) {
        this.serviceRepository = serviceRepository;
    }

    async execute(id: number): Promise<Service> {
        return await this.serviceRepository.getServiceById(id);
    }
}