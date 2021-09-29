import * as admin from 'firebase-admin';

var serviceAccount = require("./apiservice-adminsdk.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

import express, {Request, Response} from "express";

const app = express();

app.use(express.json());


// Pegar todos os serviços
app.get('/services', async (req: Request, res: Response) => {
    await db.collection('services').get().then(snapshot => {
        const services: any[] = [];
        snapshot.docs.map(doc => services.push({id: doc.id, ...doc.data()}) )
        res.status(200).json(services);
    }).catch(error => {
        res.status(500).json({error: error});    
    });
});

// Criar serviço
app.post('/services', async (req: Request, res: Response) => {
    const {title, description, value, date_register, deadline, status, comment} = req.body;
    const newService = {title, description, value: Number(value), date_register, deadline, status, comment};
    const service = await db.collection('services').add(newService);

    return res.status(200).json({id: service.id, ...newService});
});

// Atualizar serviço
app.put('/services/update/:id', async (req: Request, res: Response) => {
    const {id} = req.params;
    const {title, description, value, date_register, deadline, status, comment} = req.body;
    await db.collection('services').doc(id).set({
        title: title, description: description, value: value, date_register: date_register, 
        deadline: deadline, status: status, comment: comment
    }, {merge: true});

    return res.status(200).json({id: id, title: title, description: description, value: value, 
        date_register: date_register, deadline: deadline, status: status, comment: comment});
});

// Atualizar status do serviço
app.put('/services/status/:id', async (req: Request, res: Response) => {
    const {id} = req.params;
    const {status} = req.body;
    const newService = {status};
    await db.collection('services').doc(id).set({status: status}, {merge: true});

    return res.status(200).json({id, ...newService});
});

// Adicionar comentário ao serviço
app.put('/services/comment/:id', async (req: Request, res: Response) => {
    const {id} = req.params;
    const {comment} = req.body;
    const newService = {comment};
    await db.collection('services').doc(id).update(newService);

    return res.status(200).json({id, ...newService});
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});