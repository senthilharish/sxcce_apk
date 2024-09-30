import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

String a = '9787303208'; // Changed to String

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        body: Column(
          children: [
            SizedBox(height: 15),
            main("student dashboard",
                'https://www.sxcce.edu.in/mobile/studview.php?ph=$a'),
            main("attendance details",
                'https://www.sxcce.edu.in/mobile/absent.php?ph=$a'),
            main("Discipline details",
                'https://www.sxcce.edu.in/mobile/discipline.php?ph=$a'),
            main("event details",
                'https://www.sxcce.edu.in/mobile/events.php?ph=$a'),
            main("Fees details",
                'https://www.sxcce.edu.in/mobile/fees.php?ph=$a'),
            main("internal mark",
                'https://www.sxcce.edu.in/mobile/imarks.php?ph=$a'),
            main("end sem mark",
                'https://www.sxcce.edu.in/mobile/emarks.php?ph=$a'),
          ],
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
