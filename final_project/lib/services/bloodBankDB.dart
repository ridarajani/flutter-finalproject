import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/bloodBankModel.dart';

class BloodBankDB {
  Future getBloodBanks() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection("blood_banks").get();
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      /* BloodBankModel bloodBankModel =
          BloodBankModel.fromJson(querySnapshot.data()!); */
      return allData;
    } catch (e) {
      print(e);
    }
  }
}
