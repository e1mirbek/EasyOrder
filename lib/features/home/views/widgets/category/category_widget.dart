import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/widgets/lodaer/app_loader.dart';
import 'package:easy_order/features/home/data/models/category_model.dart';
import 'package:easy_order/features/home/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryWidget extends ConsumerWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    return categoriesAsync.when(
      data: (categoriesList) {
        if (categoriesList.isEmpty) return const SizedBox.shrink();
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categoriesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            crossAxisCount: 4,
            // Includes icon container + label without overflow.
            mainAxisExtent: 110,
          ),
          itemBuilder: (context, index) {
            final category = categoriesList[index];
            return _CategoryTile(category: category);
          },
        );
      },
      error: (err, stack) => const Text('Не удалось загрузить !'),
      loading: () => Center(
        child: AppLoader(
          size: 20.0,
          strokeWidth: 2.0,
          color: AppColors.buttonBlue,
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final CategoryModel category;

  const _CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: category.icon,
                width: 48,
                height: 48,
                fit: BoxFit.contain,
                placeholder: (_, __) => const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                errorWidget: (_, __, ___) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          category.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
