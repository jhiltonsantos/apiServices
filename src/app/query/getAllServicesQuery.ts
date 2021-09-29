import { Service } from "../../domain/entity/service";
import { iServiceRepository } from "../repository/iServiceRepository";

export class GetAllServicesQuery {
    private serviceRepository: iServiceRepository;

    constructor(serviceRepository: iServiceRepository) {
        this.serviceRepository = serviceRepository;
    }

    public async execute(): Promise<Service[]> {
        return await this.serviceRepository.allServices();
    }
}