import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Load DATA from [.json] files
class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    // ############################ In this section we are able to READ the files' PATH and NAME ############################ //
    // print("Data is uploading");
    /// The [manifestContent] will load the assets, and you need to decode them.
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");

    /// The [manifestMap] will decode the "manifestContent".
    /// Now this trying to read everything from [assets], but we just need [assets/DB/papers] and [.json].
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    /// The "papersInAssets" tells which items, PATH or FORMAT you want.
    /// At the end we want to convert [manifestMap] to a List to be able to look through [load, read, ... information] it.
    final papersInAssets = manifestMap.keys.where((path) => path.startsWith("assets/DB/papers") && path.contains(".json")).toList();
    print(papersInAssets);

    // ############################ READ the [paperInAssets'] contents ############################ //
    for (var paper in papersInAssets) {
      // We need to pass a "root" [rootBundle.loadString(*root*)], and each of the contents' root is in the "paper" variable.
      String stringPaperContent = await rootBundle.loadString(paper);
      print(stringPaperContent);
    }
  }
}
