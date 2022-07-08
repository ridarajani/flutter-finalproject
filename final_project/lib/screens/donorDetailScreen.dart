/* import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../models/requestModel.dart';
// import 'package:final_project/providers/requestsProvider.dart';

class DonorDetailScreen extends StatefulWidget {
  const DonorDetailScreen({Key? key}) : super(key: key);

  @override
  State<DonorDetailScreen> createState() => _DonorDetailScreenState();
}

class _DonorDetailScreenState extends State<DonorDetailScreen> {
  // late RequestsProvider requestsProvider;

  @override
  initState() {
    // requestsProvider = Provider.of<RequestsProvider>(context, listen: false);

    super.initState();
  }

  String? updated_at = '';
  sendDonationRequest(
      requester_id, donor_id, location, date, request_status) async {
    try {
      final request = RequestModel(
          donorID: donor_id,
          requesterID: requester_id,
          location: location,
          donReqTime: date,
          createdAt: DateTime.now().toString(),
          updatedAt: updated_at == null ? null : DateTime.now().toString(),
          requestStatus: request_status);

      // requestsProvider.addRequest(request);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 69, 147, 1),
        title: Text('Donors Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 25),
                    child: ListTile(
                      title: Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: 
                                NetworkImage(
                                  'https://images.pexels.com/photos/235621/pexels-photo-235621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User Name',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(29, 69, 147, 1)),
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(24, 32, 35, 0.5)),
                                  ),
                                  Text(
                                    'Blood Group',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(24, 32, 35, 0.5)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(129, 175, 161, 0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        tileColor: Color.fromRGBO(239, 108, 98, 0.7),
                        title: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Mobile Number :  ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '090078601',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Places the Donor can donate : ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Place One',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'Place Two',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.grey.shade400)),
                        onPressed: () {
                          // current logged in user's ID
                          final requester_id = 2;

                          // the ID of the user whose details are listed
                          final donor_id = 5;

                          String location = 'Lady Duffrin';
                          final date = '2022/06/30';
                          String request_status = 'pending';

                          sendDonationRequest(requester_id, donor_id, location,
                              date, request_status);
                        },
                        child: Text('Request Donation')),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
 */