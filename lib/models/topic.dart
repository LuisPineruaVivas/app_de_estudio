class Topic {
  final String id;
  final String imageUrl;
  final String topicTitle;
  final bool isDone;
  final String sectionsLength;
  final List sectionLaps;
  String description;
  String topicTag;

  Topic(
      {required this.id,
      required this.imageUrl,
      required this.topicTitle,
      required this.isDone,
      required this.sectionsLength,
      required this.sectionLaps,
      this.description = _description,
      required this.topicTag});
}

const _description = 'Aquie va la descripcion del tema';
