import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/userModel.dart';
import 'package:final_project/screens/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditFormScreen extends StatefulWidget {
  UserModel? userModel;
  EditFormScreen({this.userModel});

  @override
  State<EditFormScreen> createState() => _EditFormScreenState();
}

class _EditFormScreenState extends State<EditFormScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dOBController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController donatedOccasionsController = TextEditingController();

  String donor = 'no';
  String bloodGroup = '';
  String docWork = '';
  String diseases = '';
  String donatedPreviously = 'no';

  getBloodBanks() async {
    try {
      print(widget.userModel);
      /* if (usercredentials.user != null) {} */
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'My Details',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 67, 149, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: firstNameController,
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: lastNameController,
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: dOBController,
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Date of Birth',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: mobileNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: genderController,
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Gender',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: addressController,
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Address',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Become a Donor?',
                                style: TextStyle(
                                    color: Color.fromRGBO(165, 160, 160, 1),
                                    fontSize: 16.0),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text(
                                  'No',
                                  style: TextStyle(
                                      color: Color.fromRGBO(165, 160, 160, 1)),
                                ),
                                leading: Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) =>
                                          Color.fromRGBO(0, 67, 149, 0.7)),
                                  value: 'no',
                                  groupValue: donor,
                                  onChanged: (value) {
                                    setState(() {
                                      donor = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Color.fromRGBO(165, 160, 160, 1)),
                                ),
                                leading: Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) =>
                                            Color.fromRGBO(0, 67, 149, 0.7)),
                                    value: 'yes',
                                    groupValue: donor,
                                    onChanged: (value) {
                                      setState(() {
                                        donor = value.toString();
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Your Blood Group?',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(165, 160, 160, 1),
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: const Text(
                                          'A+',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromRGBO(
                                                      0, 67, 149, 0.7)),
                                          value: 'A+',
                                          groupValue: bloodGroup,
                                          onChanged: (value) {
                                            setState(() {
                                              bloodGroup = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "B+",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'B+',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "AB+",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'AB+',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "O+",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'O+',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "A-",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'A-',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "B-",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'B-',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "AB-",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'AB-',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "O-",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'yes',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Centers you can donate to?',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color:
                                            Color.fromRGBO(165, 160, 160, 1)),
                                  ),
                                  /* DropdownButtonFormField(
                                      items: items, onChanged: onChanged) */
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Have you donated previously?',
                                style: TextStyle(
                                    color: Color.fromRGBO(165, 160, 160, 1),
                                    fontSize: 16.0),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text(
                                  'No',
                                  style: TextStyle(
                                      color: Color.fromRGBO(165, 160, 160, 1)),
                                ),
                                leading: Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) =>
                                          Color.fromRGBO(0, 67, 149, 0.7)),
                                  value: 'no',
                                  groupValue: donatedPreviously,
                                  onChanged: (value) {
                                    setState(() {
                                      donatedPreviously = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Color.fromRGBO(165, 160, 160, 1)),
                                ),
                                leading: Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) =>
                                            Color.fromRGBO(0, 67, 149, 0.7)),
                                    value: 'yes',
                                    groupValue: donatedPreviously,
                                    onChanged: (value) {
                                      setState(() {
                                        donatedPreviously = value.toString();
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: donatedOccasionsController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'How many occasions?',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'In the last 6 months have you had any?',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(165, 160, 160, 1),
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: const Text(
                                          'Tattooing',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromRGBO(
                                                      0, 67, 149, 0.7)),
                                          value: 'tattooing',
                                          groupValue: docWork,
                                          onChanged: (value) {
                                            setState(() {
                                              docWork = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Ear piercing",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'ear_piercing',
                                            groupValue: docWork,
                                            onChanged: (value) {
                                              setState(() {
                                                docWork = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Dental Extraction",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'dental_extraction',
                                            groupValue: docWork,
                                            onChanged: (value) {
                                              setState(() {
                                                docWork = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Do you suffer from or have suffered from any of the following diseases?',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(165, 160, 160, 1),
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: const Text(
                                          'Heart Disease',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromRGBO(
                                                      0, 67, 149, 0.7)),
                                          value: 'heart_disease',
                                          groupValue: diseases,
                                          onChanged: (value) {
                                            setState(() {
                                              diseases = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Cancer/Malignant Disease",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'cancer/malignant_disease',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Diabetes",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'diabetes',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Hepatitis B/C",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'hepatitis',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Sexually Transmitted Diseases",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'stds',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Typhoid ( last on year)",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'typhoid',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Lung Disease",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'lung_disease',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Tuberculosis",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'tuberculosis',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Allergic Disease",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'allergic_disease',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Kidney Disease",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'kidney_disease',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Epilepsy ",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'epilepsy',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Abnormal Bleeding Tendency",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'abnormal_bleeding_tendency',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Jaundice (last one year)",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'jaundice',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Malaria (six months)",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'malaria',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Fainting Spells",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'fainting_spells',
                                            groupValue: diseases,
                                            onChanged: (value) {
                                              setState(() {
                                                diseases = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Are you taking or have you taken any of these in the past 72 hours?',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(165, 160, 160, 1),
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: const Text(
                                          'Antibiotics',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromRGBO(
                                                      0, 67, 149, 0.7)),
                                          value: 'antibiotics',
                                          groupValue: bloodGroup,
                                          onChanged: (value) {
                                            setState(() {
                                              bloodGroup = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: const Text(
                                          'Steroids',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromRGBO(
                                                      0, 67, 149, 0.7)),
                                          value: 'steroids',
                                          groupValue: bloodGroup,
                                          onChanged: (value) {
                                            setState(() {
                                              bloodGroup = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: const Text(
                                          'Aspirin',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromRGBO(
                                                      0, 67, 149, 0.7)),
                                          value: 'aspirin',
                                          groupValue: bloodGroup,
                                          onChanged: (value) {
                                            setState(() {
                                              bloodGroup = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Vaccinations",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'vaccinations',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Alcohol",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'alcohol',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 35.0,
                                      child: ListTile(
                                        title: Text(
                                          "Dog bite Rabies vaccine (1 year)",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  165, 160, 160, 1)),
                                        ),
                                        leading: Radio(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Color.fromRGBO(
                                                        0, 67, 149, 0.7)),
                                            value: 'rabies',
                                            groupValue: bloodGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                bloodGroup = value.toString();
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(0, 67, 149, 1))),
                        child: const Text('Update',
                            style: TextStyle(
                                color: Color.fromARGB(255, 252, 252, 252))),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => UserProfile()));
                        },
                      )),
                ),
              ],
            )));
  }
}
