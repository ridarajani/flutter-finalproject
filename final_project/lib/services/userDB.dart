import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/userModel.dart';

class UserDB {
  Future createHadyaUser(String firstName, String lastName, String uid,
      int mobileNumber, String gender, String Address, String DOB) async {
    var queryDoc =
        FirebaseFirestore.instance.collection("hadya_users").doc(uid);
    try {
      await queryDoc.set({
        "firstName": firstName,
        "lastName": lastName,
        "mobileNumber": mobileNumber,
        "gender": gender,
        "DOB": DOB,
        "Address": Address,
      });
      print("User Record Created Succesfully");
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel?> getHadyaUser(String uid) async {
    try {
      print(uid);
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection("hadya_users")
              .doc(uid)
              .get();
      print(documentSnapshot.data());
      UserModel userModel = UserModel.fromJson(documentSnapshot.data()!);
      return userModel;
    } catch (e) {
      print(e);
    }
  }
}
