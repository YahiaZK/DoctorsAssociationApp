import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doctors_association_app/models/user_model.dart';
import 'package:doctors_association_app/providers/auth_provider.dart';
import 'package:doctors_association_app/services/user_service.dart';

// Provider for the service
final userServiceProvider = Provider((ref) => UserService());

// StreamProvider that watches auth state and fetches user profile
final currentUserProvider = StreamProvider<UserModel?>((ref) {
  final authState = ref.watch(authStateStreamProvider);
  final userService = ref.read(userServiceProvider);

  return authState.when(
    data: (user) {
      if (user != null) {
        return userService.userStream(user.uid);
      }
      return Stream.value(null);
    },
    loading: () => Stream.value(null),
    error: (_, _) => Stream.value(null),
  );
});
