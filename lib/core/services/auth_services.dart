import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;

    }  on CustomExceptions catch (e){
        throw CustomExceptions(errorMessage: e.toString());

      }
      }
  Future<User>loginWithFacebook()async{
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =   FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      return ( await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;

  }
  Future delete()async{
    await FirebaseAuth.instance.currentUser?.delete();
    }




}