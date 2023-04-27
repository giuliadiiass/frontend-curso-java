/**
 * Configuração do firebase meu site.
 **/

const firebaseConfig = {
    apiKey: "AIzaSyC2ML8VBZc9JQtpjz1vU1nBB2rT51zYXoY",
    authDomain: "frontend-gd.firebaseapp.com",
    projectId: "frontend-gd",
    storageBucket: "frontend-gd.appspot.com",
    messagingSenderId: "981313959304",
    appId: "1:981313959304:web:4f845c62217da34cec363d"
};

// Importa o "core" do Firebase.
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.20.0/firebase-app.js";

// Importa o Authentication do Firebase.
import { getAuth, GoogleAuthProvider, signInWithPopup, signInWithRedirect, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/9.20.0/firebase-auth.js";

// Initializa o Firebase.
const fbapp = initializeApp(firebaseConfig);

// Especifica o provedor de autenticação.
const provider = new GoogleAuthProvider();

const auth = getAuth();

signInWithPopup(auth, provider)

var user;

onAuthStateChanged(auth, (user) => {
    if (user) {
        sessionStorage.userData = JSON.stringify({
            name: user.displayName,
            email: user.email,
            photo: user.photoURL,
            uid: user.uid
        })
    } else {
        delete sessionStorage.userData
    }
});

