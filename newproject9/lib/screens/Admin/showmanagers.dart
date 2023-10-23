import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newproject9/screens/Admin/addmanager.dart';

class ShowManagersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Managers',
                        style: TextStyle(
                          color: Color(0xFFD91106),
                          fontSize: 22,
                          fontFamily: 'Ramaraja',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddManagerPage()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFEB3738)),
                      minimumSize:
                          MaterialStateProperty.all(const Size(120, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Add Manager',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Ramaraja',
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ManagerList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ManagerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('managers').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final managerDocs = snapshot.data?.docs;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(
                  label: Text(
                    'NAME',
                    style: TextStyle(
                      color: Color(0xFFD91106),
                      fontFamily: 'Ramaraja',
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'AREA',
                    style: TextStyle(
                      color: Color(0xFFD91106),
                      fontFamily: 'Ramaraja',
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'PHONE',
                    style: TextStyle(
                      color: Color(0xFFD91106),
                      fontFamily: 'Ramaraja',
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text('ACTIONS',
                      style: TextStyle(
                        color: Color(0xFFD91106),
                        fontFamily: 'Ramaraja',
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
              rows: managerDocs!.map((managerDoc) {
                final name = managerDoc['name'] ?? 'N/A';
                final area = managerDoc['area'] ?? 'N/A';
                final phone = managerDoc['phone'] ?? 'N/A';

                return DataRow(
                  cells: [
                    DataCell(Text(name)),
                    DataCell(Text(area)),
                    DataCell(Text(phone)),
                    DataCell(
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ManagerDetailPage();
                          //     },
                          //   ),
                          // );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFEB3738)),
                          minimumSize:
                              MaterialStateProperty.all(const Size(80, 30)),
                        ),
                        child: const Text('View',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
