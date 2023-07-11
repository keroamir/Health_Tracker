
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class BPMContoller{
  final databaseReference = FirebaseDatabase.instance.reference();

  Future<int> fetchData() async {
    DataSnapshot snapshot = (await databaseReference.child('https://healthtracker-156e3-default-rtdb.europe-west1.firebasedatabase.app/').once()) as DataSnapshot;
    if (snapshot.value != null) {
      int value = snapshot.value as int;
      return value;
    } else {
      // Handle if data is not available
      return 0; // Return a default value or handle the absence of data
    }
  }


}