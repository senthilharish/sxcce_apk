import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawer01 extends StatefulWidget {
  final Function(String) onPhoneNumberSaved; // Callback for saved phone number

  const Drawer01({super.key, required this.onPhoneNumberSaved});

  @override
  State<Drawer01> createState() => _Drawer01();
}

class _Drawer01 extends State<Drawer01> {
 String a = '';
  final _textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPhoneNumber();
  }

  Future<void> _loadPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      a = prefs.getString('phone_number') ?? '';
      _textcontroller.text = a;
    });
  }

  Future<void> _savePhoneNumber(String number) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone_number', number);
    widget.onPhoneNumberSaved(a); // Pass updated number to main.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,
        title: const Text("SXCCE APP"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              Icon(Icons.phone_android),
              SizedBox(width: 20,),
              const Text("Edit Number",style: TextStyle(fontSize:20,fontWeight: FontWeight.w300),),

              const SizedBox(width: 50),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(children: [
                          const Text("Phone Number"),
                          SizedBox(width:5),
                           TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child:Icon(Icons.cancel_rounded),
                          ),
                        ],), 
                        content: Container(
                          child: Column(
                            children: [
                              TextField(
                                controller: _textcontroller,
                                keyboardType: TextInputType.number,
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
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Icon(Icons.edit),

              ),
            ],
          ),
        ],
      ),
    );
  }
}
