/**
 * Integração com o Firebase.com
 * By Giulia Dias
 * MIT License
 **/

/**
 * Configurações so Firebase
 * 
 * IMPORTANTE!
 * Troque os valores de 'firebaseConfig' pelos dados do SEU FIREBASE!
 **/
const firebaseConfig = {
    apiKey: "AIzaSyC2ML8VBZc9JQtpjz1vU1nBB2rT51zYXoY",
    authDomain: "frontend-gd.firebaseapp.com",
    projectId: "frontend-gd",
    storageBucket: "frontend-gd.appspot.com",
    messagingSenderId: "981313959304",
    appId: "1:981313959304:web:4f845c62217da34cec363d"
};

// Incializa o Firebase
firebase.initializeApp(firebaseConfig);

// Incializa o Firebase Authentication
const auth = firebase.auth();

// Define o provedor de autenticação
var provider = new firebase.auth.GoogleAuthProvider();