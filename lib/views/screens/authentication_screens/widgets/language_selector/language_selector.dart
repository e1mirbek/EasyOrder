import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/logic/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LanguageProvider>();
    final currentLocale = provider.appLocale;
    return PopupMenuButton<Locale>(
      initialValue: currentLocale,
      onSelected: (Locale locale) {
        provider.setLanguage(locale);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: _buildSelectorButton(context),
      itemBuilder: (context) => [
        _buildLanguageItem(
          locale: const Locale('en'),
          title: 'English',
          icon: AppAssets.isFlagEn,
          isSelected: currentLocale.languageCode == 'en',
        ),
        _buildLanguageItem(
          locale: const Locale('ru'),
          title: 'Русский',
          icon: AppAssets.isFlagRu,
          isSelected: currentLocale.languageCode == 'ru',
        ),
        _buildLanguageItem(
          locale: const Locale('ky'),
          title: 'Кыргызча',
          icon: AppAssets.isFlagKy,
          isSelected: currentLocale.languageCode == 'ky',
        ),
      ],
    );
  }

  Widget _buildSelectorButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.buttonBlue,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.language, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(S.of(context).languageName, style: AppTextStyles.buttontitle),
          const SizedBox(width: 6),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }

  PopupMenuItem<Locale> _buildLanguageItem({
    required Locale locale,
    required String title,
    required String icon,
    required bool isSelected,
  }) {
    return PopupMenuItem(
      value: locale,
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.all(AppSizes.spaceMedium),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.withOpacity(0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, height: 22, width: 22),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),

            if (isSelected)
              const Icon(Icons.check, color: Colors.blue, size: 18),
          ],
        ),
      ),
    );
  }
}
