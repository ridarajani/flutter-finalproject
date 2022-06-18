import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(
            239, 108, 98, 10) /* Color.fromRGBO(129, 175, 161, 10) */,
        title: Text('Donation History'),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    tileColor: Color.fromARGB(75, 202, 205, 204),
                    /* leading: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(0.0)), //add border radius here
                      child: Image.network(
                          'https://d27jswm5an3efw.cloudfront.net/app/uploads/2019/07/insert-image-html.jpg'), //add image location here
                    ), */
                    title: Row(
                      children: [
                        Icon(Icons.person),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Donated to Name',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(129, 175, 161, 10)),
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
                              Icon(Icons.pin_drop_outlined),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'Opposite Civil Hospital Lady Dufferin Hospital',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.date_range_outlined),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text('Wednesday 28/02/2022'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.bloodtype,
                                color: Color.fromRGBO(206, 37, 37, 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text('B+'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        Colors.green.shade200, // background
                                  ),
                                  onPressed: () {},
                                  child: Text('Donated')),
                            ],
                          )
                        ]),
                    /* trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        /*  Icon(
                          Icons.favorite,
                          color: Colors.green.shade400,
                        ), */ // icon-1
                        Icon(Icons.more_vert), // icon-2
                      ],
                    ), */
                  ),
                );
              },
              itemCount: 3,
              /* separatorBuilder: (ctx, i) {
                return Divider(
                  height: 0,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                );
              }, */
            )
          ],
        ),
      ),
    );
  }
}