import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/widgets/lodaer/app_loader.dart';
import 'package:easy_order/features/home/providers/banner_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeBanner extends ConsumerStatefulWidget {
  const HomeBanner({super.key});

  @override
  ConsumerState<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends ConsumerState<HomeBanner> {
  static const double _bannerHeight = 150.0;
  static const double _horizontalPadding = 18.0;
  static const double _verticalPadding = 13.0;
  static const double _borderRadius = 12.0;
  static const double _imageWidthFactor = 0.8;
  static const double _dotSize = 10.0;
  static const double _dotSpacing = 5.0;
  static const Duration _dotAnimationDuration = Duration(milliseconds: 300);

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banner = ref.watch(bannerProvider);

    return banner.when(
      data: (images) {
        if (images.isEmpty) {
          return const SizedBox.shrink();
        }

        return _BannerContent(
          images: images,
          pageController: _pageController,
          currentPage: _currentPage,
          bannerHeight: _bannerHeight,
          horizontalPadding: _horizontalPadding,
          verticalPadding: _verticalPadding,
          borderRadius: _borderRadius,
          imageWidthFactor: _imageWidthFactor,
          dotBuilder: _buildDot,
          onPageChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
        );
      },
      error: (error, stackTrace) {
        return _BannerError(
          onRetry: () => ref.invalidate(bannerProvider),
          height: _bannerHeight,
        );
      },
      loading: () {
        return const _BannerLoading(height: _bannerHeight);
      },
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      height: _dotSize,
      width: _dotSize,
      margin: const EdgeInsets.symmetric(horizontal: _dotSpacing),
      duration: _dotAnimationDuration,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.buttonBlue : AppColors.white,
      ),
    );
  }
}

class _BannerContent extends StatelessWidget {
  const _BannerContent({
    required this.images,
    required this.pageController,
    required this.currentPage,
    required this.bannerHeight,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.borderRadius,
    required this.imageWidthFactor,
    required this.dotBuilder,
    required this.onPageChanged,
  });

  final List<String> images;
  final PageController pageController;
  final int currentPage;
  final double bannerHeight;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final double imageWidthFactor;
  final Widget Function(bool isActive) dotBuilder;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bannerWidth = screenWidth * imageWidthFactor;

    return Column(
      children: [
        SizedBox(
          height: bannerHeight,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: onPageChanged,
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: _BannerImage(
                  imageUrl: images[index],
                  width: bannerWidth,
                  borderRadius: borderRadius,
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => dotBuilder(index == currentPage),
          ),
        ),
      ],
    );
  }
}

class _BannerImage extends StatelessWidget {
  const _BannerImage({
    required this.imageUrl,
    required this.width,
    required this.borderRadius,
  });

  final String imageUrl;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        width: width,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: width,
          decoration: BoxDecoration(
            color: AppColors.grey200,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

class _BannerError extends StatelessWidget {
  const _BannerError({required this.onRetry, required this.height});

  final VoidCallback onRetry;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Не удалось загрузить баннеры'),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Повторить'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BannerLoading extends StatelessWidget {
  const _BannerLoading({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(
        child: AppLoader(
          size: 20.0,
          strokeWidth: 2.0,
          color: AppColors.buttonBlue,
        ),
      ),
    );
  }
}
