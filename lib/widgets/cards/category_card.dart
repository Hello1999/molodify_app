import 'package:flutter/material.dart';
import 'package:melodify_app/models/category.dart';
import 'package:melodify_app/widgets/common/cached_image.dart';

class CategoryCard extends StatelessWidget {
  final MusicCategory category;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: category.color,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -10,
            child: Transform.rotate(
              angle: 0.3,
              child: AppCachedImage(
                imgUrl: category.imageUrl,
                width: 80,
                height: 80,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              category.name,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
