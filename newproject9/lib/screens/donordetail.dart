import 'package:flutter/material.dart';
import 'package:newproject9/authenticate/signin.dart';

class DonorDetailPage extends StatelessWidget {
  final String name;
  final String area;
  final String phone;
  final String lastDonationDate;
  final String bloodGroup;

  DonorDetailPage({
    required this.name,
    required this.area,
    required this.phone,
    required this.lastDonationDate,
    required this.bloodGroup,
  });

  // Function to log out
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
              buildDetailText('Name: $name'),
              buildDetailText('Area: $area'),
              buildDetailText('Phone: $phone'),
              buildDetailText('Last Donation Date: $lastDonationDate'),
              buildDetailText('Blood Group: $bloodGroup'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Functionality to initiate a phone call
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
                  child: Text('Call', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
