import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_order/features/auth/data/models/user_models.dart';
import 'package:easy_order/features/auth/providers/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = StreamProvider<UserModels?>((ref) {
  // 1. Берем текущего залогиненного юзера (его UID)
  final authState = ref.watch(authStateProvider).value;
  if (authState == null) {
    return Stream.value(null); // Если юзер не залогинен, возвращаем null
  }
  // 2. Слушаем документ этого юзера в коллекции 'buyers'
  return FirebaseFirestore.instance
      .collection('buyers')
      .doc(authState.uid)
      .snapshots()
      .map((snapshot) {
        final data = snapshot.data(); // Получаем данные документа
        if (data == null) return null; // Если данных нет, возвращаем null
        return UserModels.fromMap(data); // Преобразуем Map в UserModels
      });
});
