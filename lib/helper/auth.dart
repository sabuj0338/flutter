import 'package:lamp/helper/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods {


//  User _userFromFirebaseUser(FirebaseUser user) {
//    return user != null ? User(userId: user.uid):null;
//  }

//  Future signInWithEmailAndPassword(String email, String password) async{
//    try{
//      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
//      FirebaseUser firebaseUser = result.user;
//      return _userFromFirebaseUser(firebaseUser);
//    }catch(e){
//      print(e.toString());
//    }
//  }

//  Future signUpWithEmailAndPassword(String email, String password) async {
//    try{
//      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//      FirebaseUser firebaseUser = result.user;
//      return _userFromFirebaseUser(firebaseUser);
//    } catch(e){
//      print(e.toString());
//    }
//  }

//  Future resetPassword(String email) async{
//    try{
//      return await _auth.sendPasswordResetEmail(email: email);
//    }catch(e){
//      print(e.toString());
//    }
//  }

  Future Logout() async {
    try{
      await HelperFunctions.saveTokenSharedPreference(null);
      await HelperFunctions.saveOnboardStatusInSharedPreference(null);
      return await HelperFunctions.saveUserLoggedInSharedPreference(null);
    }catch(e){
      print(e.toString());
    }
  }
}