import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newproject9/screens/Admin/showmanagers.dart';
import 'package:newproject9/screens/donordetail.dart';

class AllDonorPage extends StatefulWidget {
  @override
  _AllDonorPageState createState() => _AllDonorPageState();
}

class _AllDonorPageState extends State<AllDonorPage> {
  final CollectionReference donorsCollection =
      FirebaseFirestore.instance.collection('donors');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Donors'),
        backgroundColor: const Color(0xFFEB3738),
        
      ),
      body: FutureBuilder(
        future: donorsCollection.get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text('No donors available.');
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> donorData =
                  document.data() as Map<String, dynamic>;

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return DonorDetailPage(
                          name: donorData['name'],
                          area: donorData['area'],
                          phone: donorData['phone'],
                          lastDonationDate: donorData['lastDonationDate'],
                          bloodGroup: donorData['bloodGroup'],
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  width: 372,
                  height: 135,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: const Color(0xFFEB3738), width: 1),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name: ${donorData['name']}'),
                      Text('Area: ${donorData['area']}'),
                      Text('Phone: ${donorData['phone']}'),
                      Text(
                          'Last Donation Date: ${donorData['lastDonationDate']}'),
                      Text('Blood Group: ${donorData['bloodGroup']}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
