import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled10/core/error/exceptions.dart';

class FirebaseAuthServices{

  Future <User> createUserWithEmailandPassword(String emailAddress, String password)async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExceptions(errorMessage: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
         throw CustomExceptions(errorMessage: 'The account already exists for that email.');
      }
      else{
        throw CustomExceptions(errorMessage: e.toString());
      }
    } catch (e) {
      throw CustomExceptions(errorMessage: e.toString());
    }
  }
  Future<User>loginUserWithEmailandPassword({required String emailAddress, required String password})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      throw CustomExceptions(errorMessage: 'البريد الألكتروني خطأ');
      } else if (e.code == 'wrong-password') {
       throw CustomExceptions(errorMessage: 'الرقم السري خطأ');
      }
      else if(e.code=='network-request-failed'){
        throw CustomExceptions(errorMessage: 'تأكد من الأتصال بالأنتيرنت');
      }
      else{
        throw CustomExceptions(errorMessage:e.toString() );
      }
      }
      catch (e) {
      throw CustomExceptions(errorMessage: e.toString());
    }

    }
    Future <User>loginWithGoogle()async{
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =  googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(idToken: googleAuth?.idToken);

        // Once signed in, return the UserCredential
        return  (await FirebaseAuth.instance.signInWithCredential(credential)).user!;

    }  on CustomExceptions catch (e){
        throw CustomExceptions(errorMessage: e.toString());

      }
      }



}