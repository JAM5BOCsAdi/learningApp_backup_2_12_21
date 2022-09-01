import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learning_app/firebase_ref/references.dart';
import 'package:learning_app/models/question_paper_model.dart';

/// Load DATA from [.json] files
class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  /// Connect to the FireStore and upload data
  Future<void> uploadData() async {
    // ############################ In this section we are able to READ the files' PATH and NAME ############################ //
    // print("Data is uploading");
    /// The [manifestContent] will load the assets, and you need to decode them.
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");

    /// The [manifestMap] will decode the "manifestContent".
    /// Now this trying to read everything from [assets], but we just need [assets/DB/papers] and [.json].
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    /// The [papersInAssets] tells which items, PATH or FORMAT you want.
    /// At the end we want to convert [manifestMap] to a List to be able to look through [load, read, ... information] it.
    final papersInAssets = manifestMap.keys.where((path) => path.startsWith("assets/DB/papers") && path.contains(".json")).toList();
    print(papersInAssets);

    List<QuestionPaperModel> questionPapers = [];

    // ############################ READ the [paperInAssets'] contents ############################ //
    for (var paper in papersInAssets) {
      // We need to pass a "root" [rootBundle.loadString(*root*)], and each of the contents' root is in the "paper" variable.
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      print(stringPaperContent);
    }
    // print("Items number ${questionPapers[0].description}");

    // ############################ Creating documents for FireBase/FireStore ############################ //
    final fireStore = FirebaseFirestore.instance;
    var batch = fireStore.batch();

    /// In each document based on [paper.id] we will have fields[title, image_url, ...] in it.
    for (var paper in questionPapers) {
      batch.set(questionPaperRef.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null ? 0 : paper.questions!.length
      });
    }
    await batch.commit();
  }
}
