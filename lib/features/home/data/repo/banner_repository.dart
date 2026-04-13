import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_order/core/errors/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bannerRepositoryProvider = Provider(
  (ref) => BannerRepository(firestore: FirebaseFirestore.instance),
);

class BannerRepository {
  final FirebaseFirestore _firestore;

  BannerRepository({required FirebaseFirestore firestore})
    : _firestore = firestore;

  Future<List<String>> fetchBanners() async {
    try {
      final snapshot = await _firestore.collection('banners').get();

      // Превращаем документы в список строк (URL картинок)
      return snapshot.docs.map((doc) => doc['image'] as String).toList();
    } catch (e) {
      throw Failure.fromException(e);
    }
  }
}
