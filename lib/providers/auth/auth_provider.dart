// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:horoscope_app/providers/auth/auth_repository.dart';
// // import 'package:go_router/go_router.dart';

// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   return AuthRepository(FirebaseAuth.instance);
// });

// final authStatusProvider = StreamProvider<User?>((ref) {
//   return ref.read(authRepositoryProvider).authStateChange;
// });

// final timeProvider =
//     StateProvider<Future<QuerySnapshot<Map<String, dynamic>>>>((ref) {
//   String userUid = FirebaseAuth.instance.currentUser!.uid;

//   return FirebaseFirestore.instance.collection('users').where(userUid).get();
// });
// // enum AuthStatus {
// //   notAuthenticated,
// //   authenticating,
// //   authenticated,
// //   unAuthenticated,
// //   userNotFound,
// //   error
// // }

// // class AuthProvider extends ChangeNotifier {
// //   FirebaseUser user;
// //   FirebaseAuth auth;
// //   AuthStatus status;
// //   static AuthProvider instance = AuthProvider();

// //   AuthProvider() {
// //     auth = FirebaseAuth.instance;
// //   }

// //   void loginUserWithEmailAndPassword(String email, String password) async {
// //     status = AuthStatus.authenticating;
// //      try {
// //       UserCredential userCredential = await FirebaseAuth.instance
// //           .signInWithEmailAndPassword(
// //               email: email, password: password);
// //       if (userCredential.user != null) {
// //         if (context.mounted) {
// //           context.go('/inicio');
// //         }
// //       }
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == 'user-not-found') {
// //         errorFeedback(
// //             'No se han encontrado usuarios registrados con ese mail', 'email');
// //       } else if (e.code == 'wrong-password') {
// //         errorFeedback('La contraseña es incorrecta', 'password');
// //       }
// //     }
// //   }
// // }
