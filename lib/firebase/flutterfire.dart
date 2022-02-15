import 'package:cloud_firestore/cloud_firestore.dart';

class DataService
{
  FirebaseFirestore? _instance;

  late Map<String, String> data = new Map();

  Map<String, String> getData()
  {
    return data;
  }

  Future getDataFromFirebase () async
  {
    _instance = FirebaseFirestore.instance;

    CollectionReference categories = _instance!.collection("data");

    DocumentSnapshot snapshot = await categories.doc("id01").get();

    var result = snapshot.data() as Map;

    for(var k in result.keys){
      data[k] = result[k];
    }

    print(data);
  }

}