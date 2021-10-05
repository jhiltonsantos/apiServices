import { Service } from "../../domain/entity/service";
import { iServiceRepository } from "../repository/iServiceRepository";

export class UpdateServiceCommand {
    private serviceRepository: iServiceRepository;

    constructor(serviceRepository: iServiceRepository) {
        this.serviceRepository = serviceRepository;
    }

    public async execute(service: Service): Promise<Service> {
        console.log(service);
        return await this.serviceRepository.updateService(service);
    }

}
