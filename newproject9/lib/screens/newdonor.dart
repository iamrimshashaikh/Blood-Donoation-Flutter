import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newproject9/screens/Admin/showmanagers.dart';

class NewDonorPage extends StatefulWidget {
  @override
  _NewDonorPageState createState() => _NewDonorPageState();
}

class _NewDonorPageState extends State<NewDonorPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController lastDonationDateController =
      TextEditingController();
  String selectedBloodGroup = 'A+';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _donorsCollection =
      FirebaseFirestore.instance.collection('donors');

  void _saveDonor() async {
    final name = nameController.text;
    final area = areaController.text;
    final phone = phoneController.text;
    final lastDonationDate = lastDonationDateController.text;
    final bloodGroup = selectedBloodGroup;

    await _donorsCollection.add({
      'name': name,
      'area': area,
      'phone': phone,
      'lastDonationDate': lastDonationDate,
      'bloodGroup': bloodGroup,
    });

    // Clear form fields or perform any other actions after saving
    nameController.clear();
    areaController.clear();
    phoneController.clear();
    lastDonationDateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Donor'),
        backgroundColor: Color(0xFFEB3738),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ShowManagersPage();
                  },
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFEB3738)),
            ),
            child: const Text(
              'All Managers',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: areaController,
                  decoration: InputDecoration(labelText: 'Area'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: lastDonationDateController,
                  decoration: InputDecoration(labelText: 'Last Donation Date'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Blood Group',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Ramaraja',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        value: selectedBloodGroup,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedBloodGroup = newValue!;
                          });
                        },
                        items: <String>[
                          'A+',
                          'B+',
                          'AB+',
                          'O+',
                          'A-',
                          'B-',
                          'AB-',
                          'O-'
                        ].map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 254,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _saveDonor,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text('SAVE', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
