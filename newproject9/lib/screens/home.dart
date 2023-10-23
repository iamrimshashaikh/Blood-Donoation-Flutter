import 'package:flutter/material.dart';
import 'package:newproject9/screens/alldonor.dart';
import 'package:newproject9/screens/newdonor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHoveredShowAll = false;
  bool isHoveredAddDonor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEB3738),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Here',
                        hintStyle: const TextStyle(color: Colors.white),
                        // filled: true,
                        // fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 500,
            child: Image.asset('images/map.png'),
          ),
          Expanded(child: Container()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Blood Groups',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEB3738),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Container(
                  height: 48,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildBloodGroupItem('A+'),
                      buildBloodGroupItem('A-'),
                      buildBloodGroupItem('B+'),
                      buildBloodGroupItem('B-'),
                      buildBloodGroupItem('AB+'),
                      buildBloodGroupItem('AB-'),
                      buildBloodGroupItem('O+'),
                      buildBloodGroupItem('O-'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildStyledButton(
                      'SHOW ALL',
                      isHoveredShowAll,
                      () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return AllDonorPage();
                        }));
                      },
                    ),
                    buildStyledButton(
                      'ADD NEW DONOR',
                      isHoveredAddDonor,
                      () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return NewDonorPage();
                        }));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBloodGroupItem(String bloodGroup) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 34,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: const Color(0xFFEB3738), width: 1),
        ),
        child: Center(
          child: Text(
            bloodGroup,
            style: const TextStyle(
              color: Color(0xFFEB3738),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStyledButton(
    String text,
    bool isHovered,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFEB3738)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(const Size(177, 48)),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: Color(0xFFEB3738),
              width: 1,
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.zero,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isHovered ? Colors.white : Colors.white,
          ),
        ),
      ),
    );
  }
}
