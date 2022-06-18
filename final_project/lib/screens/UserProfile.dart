import 'package:final_project/screens/EditFormScreen.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/user-profile.png',
              width: 160,
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                        color: Color.fromRGBO(129, 175, 161, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'username@example.com',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    'Female',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text(
                        'Donor ID: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '02545',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(129, 175, 161, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    Text(
                      '78',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Lives Saved',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 240, 240, 0.86),
                ),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Can Donate To',
                      style: TextStyle(
                          color: Color.fromRGBO(129, 175, 161, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(239, 108, 98, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                              child: Text(
                                'B+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(239, 108, 98, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                              child: Text(
                                'B+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 240, 240, 0.86),
                ),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Status :',
                          style: TextStyle(
                              color: Color.fromRGBO(129, 175, 161, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Active',
                            style: TextStyle(
                              color: Color.fromRGBO(239, 108, 98, 1),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(239, 108, 98, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Text(
                        'Donor',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        child: DataTable(
          dataRowColor: MaterialStateColor.resolveWith(
              (states) => Color.fromRGBO(240, 240, 240, 0.86)),
          dataRowHeight: 65,
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => Color.fromRGBO(129, 175, 161, 1)),
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Info',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(''),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Age')),
                DataCell(Text('12')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('DOB')),
                DataCell(Text('6-5-2021')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Address')),
                DataCell(Text('sgdf asgd fg asdgmsa')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Mobile No.')),
                DataCell(Text('02155468878')),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(129, 175, 161, 1))),
              child: const Text('Edit Profile',
                  style: TextStyle(color: Color.fromARGB(255, 252, 252, 252))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EditFormScreen()));
              },
            )),
      ),
    ]));
  }
}
