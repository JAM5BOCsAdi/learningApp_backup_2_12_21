import 'package:cloud_firestore/cloud_firestore.dart';

/// FireBase References -> Refers to the collections in FireStore
final fireStore = FirebaseFirestore.instance;
final questionPaperRef = fireStore.collection("questionPapers");
