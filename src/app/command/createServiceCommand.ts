import { Service } from "../../domain/entity/service";
import { iServiceRepository } from "../repository/iServiceRepository";

export class CreateServiceCommand {
    private serviceRepository: iServiceRepository;

    constructor(serviceRepository: iServiceRepository) {
        this.serviceRepository = serviceRepository;
    }

    public async execute(service: Service): Promise<Service> {
        return await this.serviceRepository.createService(service);
    }
}
