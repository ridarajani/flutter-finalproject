import 'package:final_project/bottom-navigation.dart';
import 'package:final_project/screens/UserProfile.dart';
import 'package:final_project/screens/donorDetailScreen.dart';
import 'package:flutter/material.dart';

class DonorList extends StatefulWidget {
  const DonorList({Key? key}) : super(key: key);

  @override
  State<DonorList> createState() => _DonorListState();
}

class _DonorListState extends State<DonorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 69, 147, 1),
        title: Text('Donors'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => UserProfile()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    tileColor: Color.fromARGB(75, 202, 205, 204),
                    title: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DonorDetailScreen())); */
                              },
                              child: Text(
                                'User Name',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(29, 69, 147, 1)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('0300 1236976'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.pin_drop_outlined,
                                size: 18,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Test street, city',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                    leading: Container(
                      height: double.infinity,
                      child: Image.asset(
                        'assets/images/user-profile.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    trailing: Container(
                      height: double.infinity,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(29, 69, 147, 1),
                        child: Text(
                          'B+',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 5,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
