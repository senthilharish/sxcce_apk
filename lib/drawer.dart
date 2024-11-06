import 'package:flutter/material.dart';
import 'package:sxcce_apk/main.dart';

class Drawer01 extends StatefulWidget {
  const Drawer01({super.key});

  @override
  State<Drawer01> createState() => _Drawer01State();
}

class _Drawer01State extends State<Drawer01> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SXCCE student APP",style:TextStyle(fontWeight: FontWeight.bold),),
        ),
        body:Column(
          children: [
            const SizedBox(height: 50,),
            Container(
              child:Row(
                children: [
                   const Icon(Icons.settings_applications_rounded),
                  TextButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp()),
                    );
                  }, child: const Text("settings", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                  const SizedBox(width: 25,),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
