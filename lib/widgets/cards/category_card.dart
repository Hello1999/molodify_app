import 'package:flutter/material.dart';
import 'package:melodify_app/models/category.dart';

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
      child: Stack(children: [
          
        ],
      ),
    );
  }
}
