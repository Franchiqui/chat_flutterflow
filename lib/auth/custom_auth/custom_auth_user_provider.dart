import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class ChatAuthUser {
  ChatAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserAuthStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<ChatAuthUser> chatAuthUserSubject =
    BehaviorSubject.seeded(ChatAuthUser(loggedIn: false));
Stream<ChatAuthUser> chatAuthUserStream() =>
    chatAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
