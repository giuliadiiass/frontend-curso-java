import { initializeApp } from 'https://www.gstatic.com/firebasejs/9.19.0/firebase-app.js'
import { getAuth, signInWithPopup, GoogleAuthProvider,  signInWithRedirect, onAuthStateChanged, reauthenticateWithCredential } from 'https://www.gstatic.com/firebasejs/9.19.0/firebase-auth.js'
import { getFirestore, collection, query, where, getDoc, getDocs, addDoc, serverTimestamp, doc, orderBy } from 'https://www.gstatic.com/firebasejs/9.19.0/firebase-firestore.js'
const firebaseConfig = {
    apiKey: "AIzaSyBfWBlHOfE7N3J6K_swDzi2Zz6nSWfjd_4",
    authDomain: "projetoum-fe477.firebaseapp.com",
    // authDomain: "localhost:5500",
    projectId: "projetoum-fe477",
    storageBucket: "projetoum-fe477.appspot.com",
    messagingSenderId: "746077889552",
    appId: "1:746077889552:web:f6c520f9f6e1983b849695"
};
const app = initializeApp(firebaseConfig);
const provider = new GoogleAuthProvider();

const auth = getAuth();
signInWithPopup(auth, provider)
  .then((result) => {
    // This gives you a Google Access Token. You can use it to access the Google API.
    const credential = GoogleAuthProvider.credentialFromResult(result);
    const token = credential.accessToken;
    // The signed-in user info.
    const user = result.user;
    // IdP data available using getAdditionalUserInfo(result)
    // ...
  }).catch((error) => {
    // Handle Errors here.
    const errorCode = error.code;
    const errorMessage = error.message;
    // The email of the user's account used.
    const email = error.customData.email;
    // The AuthCredential type that was used.
    const credential = GoogleAuthProvider.credentialFromError(error);
    // ...
  });
