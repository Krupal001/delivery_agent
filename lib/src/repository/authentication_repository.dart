import 'package:delivery_agent/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../features/authentication/screens/welcome/welcome_main.dart';
import 'exceptions/login_with_mail_password_failure.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'exceptions/signup_mail_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth=FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;


  @override
  void onReady() {
    firebaseUser= Rx<User?> (_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User? user) {
    user==null?Get.offAll(()=>const WelcomeScreen()):Get.offAll(()=>const HomeScreen());
  }
  Future<String?> createUserWithEmailAndPassword(String email,String password)async{
      try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value!=null?Get.offAll(()=>const HomeScreen()):Get.offAll(()=>const WelcomeScreen());
      }on FirebaseAuthException catch(e){
        final ex=SignupWithEmailAndPasswordFailure.code(e.code);
        return ex.message;
      } catch(_){
        const ex=SignupWithEmailAndPasswordFailure();
        return ex.message;
      }
      return null;
  }

  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value!=null?Get.offAll(()=>const HomeScreen()):Get.offAll(()=>const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailAndPasswordFailure.code(e.code);

      return ex.message;
    } catch (_) {
      const ex = LoginWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
   // try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      //auth._setInitialScreen(auth.firebaseUser as User?);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    // }on FirebaseAuthException catch(e){
    //   final ex=SignupWithEmailAndPasswordFailure.code(e.code);
    //   throw ex.message;
    // } catch(_){
    //   const ex=SignupWithEmailAndPasswordFailure();
    //   throw ex.message;
    // }

  }
      Future<void> logout() async => await _auth.signOut();


    }
