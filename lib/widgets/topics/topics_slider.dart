import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:app_de_estudio/data/topic_data.dart';
import 'package:app_de_estudio/widgets/topics/tag.dart';
import 'package:flutter/material.dart';

class TopicsSlider extends StatelessWidget {
  const TopicsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: topicsData.length,
          itemBuilder: (BuildContext context, int index) {
            return TopicTile(
              id: topicsData[index].id,
              imageUrl: topicsData[index].imageUrl,
              topicTitle: topicsData[index].topicTitle,
              isDone: topicsData[index].isDone,
              tagTitle: topicsData[index].topicTag,
              sectionsLenght: topicsData[index].sectionsLength,
            );
          }),
    );
  }
}

// ignore: must_be_immutable
class TopicTile extends StatelessWidget {
  String? id;
  final String imageUrl;
  final String topicTitle;
  final bool isDone;
  final String tagTitle;
  final String sectionsLenght;
  Widget child;

  TopicTile(
      {super.key,
      required this.id,
      required this.imageUrl,
      required this.topicTitle,
      required this.isDone,
      required this.tagTitle,
      this.child = const SizedBox(),
      required this.sectionsLenght});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 8, right: 5),
              constraints: const BoxConstraints.expand(height: 150, width: 250),
              padding: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover)),
            ),
            Text(topicTitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text(
                  sectionsLenght,
                  style: const TextStyle(
                    fontSize: 14,
                    color: onSurfaceTextColor,
                  ),
                ),
                const SizedBox(width: 5),
                Tag(title: tagTitle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
