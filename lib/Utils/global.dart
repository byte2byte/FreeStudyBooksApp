import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser = fAuth.currentUser;

final List<String> users = [];
