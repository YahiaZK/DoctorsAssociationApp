import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

// 1. Simple provider for the service
final authServiceProvider = Provider((ref) => AuthService());

// 2. Stream provider to track the Firebase User (the "Gatekeeper" source)
final authStateStreamProvider = StreamProvider((ref) {
  return ref.watch(authServiceProvider).authStateChanges;
});

// 3. The New AsyncNotifier Logic
// We use <void> because login/signup doesn't return data, it just changes state
class AuthController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // Initial state is nothing (data)
    return null;
  }

  Future<void> login(String email, String password) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncLoading(); // Set UI to loading
    state = await AsyncValue.guard(() => authService.login(email, password));
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authService.signUp(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      ),
    );
  }

  Future<void> logout() async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authService.logout());
  }
}

// 4. The Provider for our controller
final authControllerProvider = AsyncNotifierProvider<AuthController, void>(() {
  return AuthController();
});
