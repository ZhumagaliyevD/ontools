import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OnToolsFirebaseUser {
  OnToolsFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

OnToolsFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<OnToolsFirebaseUser> onToolsFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<OnToolsFirebaseUser>(
      (user) {
        currentUser = OnToolsFirebaseUser(user);
        return currentUser!;
      },
    );
