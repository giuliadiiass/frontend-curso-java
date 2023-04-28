/**
 * Integração com o Firebase.com
 * By giulia dias
 * MIT License
 **/

// Importa o "core" do Firebase.
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.20.0/firebase-app.js";

// Importa o Authentication do Firebase.
import { getAuth, GoogleAuthProvider, signInWithPopup, signInWithRedirect, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/9.20.0/firebase-auth.js";


// Importa o "core" do Firebase.
const firebaseConfig = {
    apiKey: "AIzaSyC2ML8VBZc9JQtpjz1vU1nBB2rT51zYXoY",
    authDomain: "frontend-gd.firebaseapp.com",
    projectId: "frontend-gd",
    storageBucket: "frontend-gd.appspot.com",
    messagingSenderId: "981313959304",
    appId: "1:981313959304:web:4f845c62217da34cec363d"
};

// Initializa o Firebase.
const fbapp = initializeApp(firebaseConfig);

// Inicializa o mecanismo de autenticação.
const auth = getAuth();

// Especifica o provedor de autenticação.
const provider = new GoogleAuthProvider();

// Observa o status de autenticação do usuário.
onAuthStateChanged(auth, (user) => {
    if (user) {
        sessionStorage.userData = JSON.stringify({
            name: user.displayName,
            email: user.email,
            photo: user.photoURL,
            uid: user.uid,
            created: user.metadata.createdAt,
            lastLogin: user.metadata.lastLoginAt 
        })
    } else {
        delete sessionStorage.userData
    }
});

// executa a jQuery quando o documento estiver pronto.
$(document).ready(myFirebase)


function myFirebase() {

    // Detecta cliques no botão de login.
    $('#navUser').click(login)
}

function login() {

    // Se não está logado...
    if (!sessionStorage.userData) {

        // Faz login usando popup.
        signInWithPopup(auth, provider)

            // Se logou corretamente.
            .then(() => {

                // Redireciona para a 'home'.
                location.href = '/home'
            })

        // Se está logado..
    } else

        // Redireciona para 'profile'.
        location.href = '/profile'
    return false
}2