contract SimpleMultiSig {
     address alice1;
     address alice2;
     address bob;
     uint numSigned = 0;
     bytes32 error;
     bool registeredYet;
     mapping (address => bool) signedYet;

     function SimpleMultiSig() {
       bob = msg.sender;
       registeredYet = false;
     }

     function register(address registerAlice1, address registerAlice2) {
       if (msg.sender == bob && registeredYet == false) {
           alice1 = registerAlice1;
           alice2 = registerAlice2;
           registeredYet = true;
       } else if (msg.sender == bob) {
           error = "registered already";
       } else {
         error = "you are not bob!";
       }
   }

   function withdraw(address to) {
     if ((msg.sender == alice1 || msg.sender == alice2) && numSigned >= 2) {
        to.send(this.balance);
        numSigned = 0;
       signedYet[alice1] = signedYet[alice2] = signedYet[bob] = false;
     } else {
        error = "cannot withdraw yet!";
     }
   }

   function addSignature() {
     if (msg.sender == alice1 && signedYet[alice1]==false) {
       signedYet[alice1] = true;
       numSigned++;
     } else if (msg.sender == alice2 && signedYet[alice2]==false) {
       signedYet[alice2] = true;
       numSigned++;
     } else if (msg.sender == bob && signedYet[bob]==false) {
       signedYet[bob] = true;
       numSigned++;
     } else {
       error = 'unknown address';
     }
   }
}
