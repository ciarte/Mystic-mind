import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/providers/auth/auth_provider.dart';
import 'package:horoscope_app/screens/vm/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
            email,
            password,
          );
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  void signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }

  void create(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authRepositoryProvider).createUser(
            email,
            password,
          );
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  void update(String name, String birthday) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authRepositoryProvider).updateUser(name, birthday);

      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
