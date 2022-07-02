import 'package:flutter/cupertino.dart';
import 'package:final_project/models/requestModel.dart';

class RequestsProvider with ChangeNotifier {
  final List<RequestModel> requests = [];

  addRequest(RequestModel newRequest) {
    requests.add(newRequest);
    notifyListeners();
  }

  /*  deleteContact(String id) {
    contacts.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  updateContact(RequestModel updatedContact) {
    contacts[
            contacts.indexWhere((element) => element.id == updatedContact.id)] =
        updatedContact;
    notifyListeners();
  } */
}
