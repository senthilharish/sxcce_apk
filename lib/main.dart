import 'package:flutter/material.dart';
import 'package:sxcce_apk/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String phoneNumber='';

  @override
  void initState() {
    super.initState();
    _loadPhoneNumber();
  }

  Future<void> _loadPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = prefs.getString('phone_number') ?? '';
    });
  }

  void _updatePhoneNumber(String newNumber) {
    setState(() {
      phoneNumber = newNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: Drawer01(onPhoneNumberSaved: _updatePhoneNumber), // Pass callback to Drawer01
        ),
        appBar: AppBar(
          title: const Center(
            child: Text(
              "SXCCE APP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          backgroundColor:Colors.blueGrey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 27),
              const SizedBox(height: 20),
              main("Student Details",
                  'https://www.sxcce.edu.in/mobile/studview.php?ph=$phoneNumber'),
              const SizedBox(height: 20),
              main("Attendance Details",
                  'https://www.sxcce.edu.in/mobile/absent.php?ph=$phoneNumber'),
              const SizedBox(height: 20),
              main("Disciplinary Details",
                  'https://www.sxcce.edu.in/mobile/discipline.php?ph=$phoneNumber'),
              const SizedBox(height: 20),
              main("Event Details",
                  'https://www.sxcce.edu.in/mobile/events.php?ph=$phoneNumber'),
              const SizedBox(height: 20),
              main("Fees Details",
                  'https://www.sxcce.edu.in/mobile/fees.php?ph=$phoneNumber'),
              const SizedBox(height: 20),
              main("Internal Mark",
                  'https://www.sxcce.edu.in/mobile/imarks.php?ph=$phoneNumber'),
              const SizedBox(height: 20),
              main("End Sem Mark",
                  'https://www.sxcce.edu.in/mobile/emarks.php?ph=$phoneNumber'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Center main(String title, String link) {
    return Center(
      child: Container(
        width: 330,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blueGrey ,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse(link);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.inAppWebView);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const Text("Click Here"),
            ),
          ],
        ),
      ),
    );
  }
}
