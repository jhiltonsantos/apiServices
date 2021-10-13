const addElementService = (service) => {
    const template = document.createElement('template-services');
    console.log(template.content);
    const serviceElement = document.importNode(template.content, true);
    const serviceContent = serviceElement.querySelectorAll('span');

    serviceContent[0].innerText = service.title;
    serviceContent[1].innerText = service.description;
    serviceContent[2].innerText = service.value;
    serviceContent[3].innerText = service.date_register;
    serviceContent[4].innerText = service.deadline;
    serviceContent[5].innerText = service.status;
    serviceContent[6].innerText = service.comment;

    return serviceElement;
}

const getServices = async () => {
    try {
        const res = await fetch('http://localhost:3000/services');
        const data = await res.json();
        console.log(data);
        data.forEach(service => {
            const containerService = document.createElement('container-services');
            const serviceElement = addElementService(service);
            containerService.appendChild(serviceElement);
        });
    } catch (error) {
        console.log(error);
    }
}


window.onload = () => {
    getServices();
    console.log('services.js loaded');
}