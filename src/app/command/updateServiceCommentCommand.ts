import { Service } from "../../domain/entity/service";
import { iServiceRepository } from "../repository/iServiceRepository";

export class UpdateServiceCommentCommand {
    private serviceRepository: iServiceRepository;

    constructor(serviceRepository: iServiceRepository) {
        this.serviceRepository = serviceRepository;
    }

    public async execute(id: string, comment: string): Promise<Service> {
        return await this.serviceRepository.updateServiceComment(id, comment);
    }

}
