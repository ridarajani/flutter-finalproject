// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_project/models/requestModel.dart';

// class RequestDBService {
//   Future createDocument(
//       String name, String fatherName, int age, String studentId) async {
//     var queryDoc =
//         FirebaseFirestore.instance.collection("students").doc(studentId);
//     try {
//       await queryDoc.set({
//         "name": name,
//         "fatherName": fatherName,
//         "age": age,
//         "studentId": studentId
//       });
//       print("User Record Created Succesfully");
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<RequestModel?> getRequest(String donorID) async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
//           await FirebaseFirestore.instance
//               .collection("requests")
//               .doc(donorID)
//               .get();
//       print(documentSnapshot.data());
//       RequestModel requestModel =
//           RequestModel.fromJson(documentSnapshot.data()!);
//       print(RequestModel);
//       return requestModel;
//     } catch (e) {
//       print(e);
//     }
//   }
// }
