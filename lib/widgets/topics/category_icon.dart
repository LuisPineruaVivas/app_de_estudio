import 'package:app_de_estudio/models/topics_category.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final TopicsCategory category;
  const CategoryIcon({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.grey[600]!, blurStyle: BlurStyle.outer)
            ], color: Colors.black, shape: BoxShape.circle),
            child: Center(
                child: Icon(
              category.categoryIcon,
              size: 25,
            )),
          ),
          const SizedBox(height: 5),
          Text(
            category.categoryTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
