import 'dart:ui';
import 'package:dating_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';

class LimitedOfferSheet extends StatelessWidget {
  const LimitedOfferSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bonuses = [
      {'icon': Assets.icon.diamond, 'label': 'Premium\nHesap'},
      {'icon': Assets.icon.favs, 'label': 'Daha\nFazla Eşleşme'},
      {'icon': Assets.icon.upalt, 'label': 'Öne\nÇıkarma'},
      {'icon': Assets.icon.fav, 'label': 'Daha\nFazla Beğeni'},
    ];

    final packages = [
      {
        'old_coins': '200',
        'new_coins': '330',
        'bonus': '+10%',
        'price': '₺99,99',
        'is_highlighted': false,
        'gradient': const [Color(0xFFD32F2F), Color(0xFFE53935)],
      },
      {
        'old_coins': '2.000',
        'new_coins': '3.375',
        'bonus': '+70%',
        'price': '₺799,99',
        'is_highlighted': true,
        'gradient': const [Color(0xFF8E24AA), Color(0xFFD81B60)],
      },
      {
        'old_coins': '1.000',
        'new_coins': '1.350',
        'bonus': '+35%',
        'price': '₺399,99',
        'is_highlighted': false,
        'gradient': const [Color(0xFFD32F2F), Color(0xFFE53935)],
      },
    ];

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(28.0)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: const LinearGradient(
              colors: [Color(0xAA330808), Color(0xDD000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sınırlı Teklif',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Jeton paketin\'ni seçerek bonus kazanın ve yeni bölümlerin kilidini açın!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 24),

                _buildBonusSection(bonuses),
                const SizedBox(height: 32),

                const Text(
                  'Kilidi açmak için bir jeton paketi seçin',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: packages
                      .map((pkg) => _PackageCard(packageData: pkg))
                      .toList(),
                ),
                const SizedBox(height: 32),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE53935),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Tüm Jetonları Gör',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBonusSection(List<Map<String, dynamic>> bonuses) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          const Text(
            'Alacağınız Bonuslar',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: bonuses
                .map(
                  (bonus) =>
                      _BonusItem(icon: bonus['icon'], label: bonus['label']),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _BonusItem extends StatelessWidget {
  final AssetGenImage icon;
  final String label;

  const _BonusItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white.withOpacity(0.1),
          child:  icon.image(fit: BoxFit.scaleDown),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}

class _PackageCard extends StatelessWidget {
  final Map<String, dynamic> packageData;

  const _PackageCard({required this.packageData});

  @override
  Widget build(BuildContext context) {
    final bool isHighlighted = packageData['is_highlighted'];
    final List<Color> gradientColors = packageData['gradient'];

    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 250,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: isHighlighted
                  ? Border.all(color: Colors.purple.shade200, width: 2)
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    packageData['new_coins'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Divider(),
                      Text(
                        packageData['price'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Başına haftalık',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isHighlighted
                    ? const Color(0xFF9C27B0)
                    : const Color(0xFFC62828),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                packageData['bonus'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
