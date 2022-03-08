import 'package:firebase_auth/firebase_auth.dart';

import '../models/result.dart';

class LoginBloc{
  Future<Result> signUp(String email,String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email, password: password);
        print("1");
      return Result.success(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("2");
        return Result.error(
            message: "La contraseña debe tener mínimo 6 caracteres");
      } else if (e.code == 'email-already-in-use') {
        print("3");
        return Result.error(
            message:
            "Ya existe una cuenta registrada con este correo, intenta con otro.");
      }
    } catch (e) {
      print(e);
      return Result.error(message: 'Hubo un error, intente mas tarde');
    }
    print("5");
    return Result.error(message: 'Hubo un error, intente mas tarde');
  }
  Future<Result<UserCredential>> signIn(String email,String password) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Result.error(
            message: 'Correo o contraseña incorrectos');
      } else if (e.code == 'wrong-password') {
        return Result.error(message: 'Correo o contraseña incorrectos');
      }
    }
    return Result.error(message: 'Hubo un error, intente mas tarde');
  }
  Future<Result<bool>> googleSignOut() async {
    try {
      //await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      return Result.success(true);
    } catch (e) {
      return Result.error(message: 'Hubo un error, intente mas tarde');
    }
  }
}