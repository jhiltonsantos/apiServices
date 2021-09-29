import * as admin from 'firebase-admin';

var serviceAccount = require("./apiservice-adminsdk.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

export const db = admin.firestore();