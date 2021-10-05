import { Service } from "../../domain/entity/service";
import { iServiceRepository } from "../repository/iServiceRepository";

export class UpdateServiceStatusCommand {
    private serviceRepository: iServiceRepository;

    constructor(serviceRepository: iServiceRepository) {
        this.serviceRepository = serviceRepository;
    }

    public async execute(id: string, status: string): Promise<Service> {
        return await this.serviceRepository.updateServiceStatus(id, status);
    }
}
