import 'package:app_de_estudio/models/topic.dart';

final topicsData = [
  Topic(
    id: '1',
    imageUrl: "assets/images/image1.jpeg",
    topicTitle: 'Tema 1',
    isDone: false,
    sectionsLength: '8 Lecciones',
    sectionLaps: sections,
    topicTag: tags[0],
  ),
  Topic(
    id: '2',
    imageUrl: "assets/images/image2.jpeg",
    topicTitle: 'Tema 2',
    isDone: false,
    sectionsLength: '12 Lecciones',
    sectionLaps: sections,
    topicTag: tags[1],
  ),
  Topic(
    id: '3',
    imageUrl: "assets/images/image1.jpeg",
    topicTitle: 'Tema 3',
    isDone: false,
    sectionsLength: '10 Lecciones',
    sectionLaps: sections,
    topicTag: tags[2],
  ),
  Topic(
    id: '4',
    imageUrl: "assets/images/image2.jpeg",
    topicTitle: 'Tema 4',
    isDone: false,
    sectionsLength: '10 Lecciones',
    sectionLaps: sections,
    topicTag: tags[3],
  ),
  Topic(
    id: '5',
    imageUrl: "assets/images/image1.jpeg",
    topicTitle: 'Tema 5',
    isDone: true,
    sectionsLength: '5 Lecciones',
    sectionLaps: sections,
    topicTag: tags[4],
  ),
];

List sections = [
  ['Introduction to Topic', '20 min'],
  ['Dive in', '4h 40 min'],
  ['How to apply what you learned', '2h 20 min'],
  ['Outro', '40 min'],
];

List tags = [
  'Hot',
  'New',
  'Best',
  'Most Viewed',
  'Must Learn',
];
