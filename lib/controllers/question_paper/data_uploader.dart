import 'dart:convert';
import 'package:app_de_estudio/firebase_ref/loading_status.dart';
import 'package:app_de_estudio/firebase_ref/references.dart';
import 'package:app_de_estudio/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading;
    final firestore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final paperInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();
    List<QuestionPaperModel> questionsPapers = [];
    for (var paper in paperInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionsPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    //print("items ${questionsPapers[0].description}");
    var batch = firestore.batch();
    for (var paper in questionsPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null ? 0 : paper.questions!.length
      });

      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });

        for (var answer in questions.answers) {
          batch.set(questionPath.collection("answers").doc(answer.identifier),
              {"identifier": answer.identifier, "answer": answer.answer});
        }
      }
    }

    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
