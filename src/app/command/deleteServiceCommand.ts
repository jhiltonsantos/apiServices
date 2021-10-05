import { Service } from "../../domain/entity/service";
import { iServiceRepository } from "../repository/iServiceRepository";

export class DeleteServiceCommand {
    private serviceRepository: iServiceRepository;

    constructor(serviceRepository: iServiceRepository) {
        this.serviceRepository = serviceRepository;
    }

    public async execute(id: string): Promise<Service> {
        return await this.serviceRepository.deleteService(id);
    }
}
