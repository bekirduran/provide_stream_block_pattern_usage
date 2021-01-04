import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum userState {
  logined,
  notLogin,
  logging,
}



class AuthService with ChangeNotifier {
final FirebaseAuth _auth = FirebaseAuth.instance;
 userState _state = userState.notLogin;
 User _user;

set state(userState value) {
    _state = value;
    notifyListeners();
  }

  userState get state => _state;
  User get user => _user;

  AuthService(){
  _auth.authStateChanges().listen(_authStateChanged);
}
void _authStateChanged(User user){
if(user ==null){
  _user = null;
state = userState.notLogin;
}
else {
  _user = user;
  state = userState.logined;
}
}

Future<User> createUserWithEmailAndPassword(String email, String password) async
{
try{
  state = userState.logging;
  UserCredential _credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  User _newUser = _credential.user;
  _user = _newUser;
  return _newUser;
}catch(e){
  state = userState.notLogin;
  print("Error when create a new user:::: $e");
  return null;
}
}

Future<User> singIngUserWithEmailAndPassword(String email, String password) async
{
  try{
    state = userState.logging;
    UserCredential _credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User _loggingUser = _credential.user;
    _user = _loggingUser;
    return _loggingUser;
  }catch(e){
    state = userState.notLogin;
    print("Error when logging a new user:::: $e");
    return null;
  }
}

Future<bool> signOut() async{
   try {
  await _auth.signOut();
  _user = null;
  state = userState.notLogin;
  return true;
   }catch(e){
     print("Error when signing out ::: $e");
     return false;
   }
}


}