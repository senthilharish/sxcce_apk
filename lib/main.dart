import 'package:flutter/material.dart';
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
  String a = ''; 
  final _textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPhoneNumber();
  }

  // Load saved phone number from local storage
  Future<void> _loadPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      a = prefs.getString('phone_number') ?? '';
      _textcontroller.text = a; // Display saved number in TextField
    });
  }

  // Save phone number to local storage
  Future<void> _savePhoneNumber(String number) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone_number', number);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "sxcce student app",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 35, 147, 159),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 27),
              TextField(
                controller: _textcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter the phone number",
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    a = _textcontroller.text.trim();
                  });
                  _savePhoneNumber(a); // Save number to local storage
                },
                color: Colors.blueGrey,
                child: const Text("Save"),
              ),
              const SizedBox(height: 20),
              main("student Dashboard",
                  'https://www.sxcce.edu.in/mobile/studview.php?ph=$a'),
              const SizedBox(height: 20),
              main("Attendance Details",
                  'https://www.sxcce.edu.in/mobile/absent.php?ph=$a'),
              const SizedBox(height: 20),
              main("Disciplinary details",
                  'https://www.sxcce.edu.in/mobile/discipline.php?ph=$a'),
              const SizedBox(height: 20),
              main("Event Details",
                  'https://www.sxcce.edu.in/mobile/events.php?ph=$a'),
              const SizedBox(height: 20),
              main("Fees Details",
                  'https://www.sxcce.edu.in/mobile/fees.php?ph=$a'),
              const SizedBox(height: 20),
              main("Internal Mark",
                  'https://www.sxcce.edu.in/mobile/imarks.php?ph=$a'),
              const SizedBox(height: 20),
              main("End Sem Mark",
                  'https://www.sxcce.edu.in/mobile/emarks.php?ph=$a'),
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
        width: 370,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 35, 147, 159),
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
