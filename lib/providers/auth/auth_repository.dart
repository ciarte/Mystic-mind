// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthRepository {
//   const AuthRepository(this._auth);

//   final FirebaseAuth _auth;

//   Stream<User?> get authStateChange => _auth.idTokenChanges();

//   Future<User?> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       final result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return result.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         throw AuthException(
//             'No se han encontrado usuarios registrados con ese mail');
//       } else if (e.code == 'wrong-password') {
//         throw AuthException('La contraseña es incorrecta');
//       } else {
//         throw AuthException('Ocurrio un error, intenta nuevamente');
//       }
//     }
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }

//   Future createUser(String email, String password) async {
//     try {
//       final result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return result.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         throw AuthException('La contraseña debe tener al menos 6 caracteres');
//       } else if (e.code == 'email-already-in-use') {
//         throw AuthException('El mail ya ha sido utilizado por otro usuario');
//       }
//     } catch (e) {
//       throw AuthException(e.toString());
//     }
//   }

//   Future<void> updateUser(String name, String birthday) async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         print(user);
//         Map<String, dynamic> updatedUserData = {
//           'displayName': name,
//           'birthday': birthday,
//         };
//         await user.updateDisplayName(name);

//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .update(updatedUserData);

//         print(user);
//       }
//     } on FirebaseAuthException catch (e) {
//       // Manejo de errores específicos de FirebaseAuth
//       // ...
//     } catch (e) {
//       // Manejo de errores genéricos
//       // ...
//     }
//   }
// }

// class AuthException implements Exception {
//   final String message;
//   AuthException(this.message);

//   @override
//   String toString() {
//     return message;
//   }
// }
