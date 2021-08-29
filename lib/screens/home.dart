import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  var name = "";
  var email = "";
  var pass = "";
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Name", labelStyle: TextStyle(fontSize: 20.0)),
              controller: namecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Plz Enter Name";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Email", labelStyle: TextStyle(fontSize: 20.0)),
              controller: emailcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Plz Enter Email";
                } else if (!value.contains("@")) {
                  return "Plz enter valid email";
                }
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password", labelStyle: TextStyle(fontSize: 20.0)),
              controller: passcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Plz Enter Password";
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      name = namecontroller.text;
                      email = emailcontroller.text;
                      pass = passcontroller.text;
                    });
                  }
                },
                child: Text("Submit")),
            Text(
              "Name : $name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Email : $email",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Password : $pass",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
