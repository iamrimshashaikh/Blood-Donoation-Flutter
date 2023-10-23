import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newproject9/authenticate/signin.dart';

class AddManagerPage extends StatefulWidget {
  @override
  _AddManagerPageState createState() => _AddManagerPageState();
}

class _AddManagerPageState extends State<AddManagerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String selectedBloodGroup = 'A+';

  final CollectionReference _managersCollection =
      FirebaseFirestore.instance.collection('managers');

  void saveManagerInfo() {
    final managerInfo = {
      'name': nameController.text,
      'area': areaController.text,
      'phone': phoneController.text,
      'bloodGroup': selectedBloodGroup,
    };

    _managersCollection.add(managerInfo);

    nameController.clear();
    areaController.clear();
    phoneController.clear();
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Details'),
        backgroundColor: Color(0xFFEB3738),
        actions: [
          ElevatedButton(
            onPressed: () {
              _logout(context);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFEB3738)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: Text('Logout',
                style: TextStyle(color: Colors.white, fontSize: 15)),
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
                    onPressed: () {
                      saveManagerInfo();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFEB3738)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'ADD MANAGER',
                      style: TextStyle(color: Colors.white),
                    ),
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
