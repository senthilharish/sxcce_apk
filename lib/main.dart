import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String a = ''; // Changed to String
  final _textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "sxcce student app",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(222, 121, 80, 217),
        ),
        body: SingleChildScrollView(
          child:Column(
          children: [
            SizedBox(height: 27,),
            TextField(
              controller: _textcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter the phone number",),
                  
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  a = _textcontroller.text; // Updating the string
                });
              },
              color: Colors.blueGrey,
              child: const Text("click"),
            ),
            SizedBox(height: 20),
            main("student Dashboard",
                'https://www.sxcce.edu.in/mobile/studview.php?ph=$a'),
                SizedBox(height: 20),
            main("Attendance Details",
                'https://www.sxcce.edu.in/mobile/absent.php?ph=$a'),
                SizedBox(height: 20),
            main("Discipliary details",
                'https://www.sxcce.edu.in/mobile/discipline.php?ph=$a'),
                SizedBox(height: 20),
            main("Event Details",
                'https://www.sxcce.edu.in/mobile/events.php?ph=$a'),
                SizedBox(height: 20),
            main("Fees Details",
                'https://www.sxcce.edu.in/mobile/fees.php?ph=$a'),
                SizedBox(height: 20),
            main("Internal Mark",
                'https://www.sxcce.edu.in/mobile/imarks.php?ph=$a'),
                SizedBox(height: 20),
            main("End Sem Mark",
                'https://www.sxcce.edu.in/mobile/emarks.php?ph=$a'),
                SizedBox(height: 20),
          ],
        ),
        )
      ),
    );
  }

  Center main(String title, String link) {
    return Center(
      child: Container(
        width: 370,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(222, 121, 80, 217),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              child: Text("Click Here"),
            ),
          ],
        ),
      ),
    );
  }
}
