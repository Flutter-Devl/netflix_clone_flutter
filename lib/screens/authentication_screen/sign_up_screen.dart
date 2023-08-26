import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "STEP 2 OF 3",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 19),
            const Text(
              "Create your account",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 100),
            _formWidget(),
          ],
        ),
      ),
    );
  }

  Widget _formWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: "Email",
              border: InputBorder.none,
              labelStyle: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              border: InputBorder.none,
              labelStyle: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Checkbox(
              value: _isCheck,
              onChanged: (value) {
                setState(() {
                  _isCheck = value ?? false;
                });
              },
            ),
            const Text("Please do not email me Netflix special offers.")
          ],
        ),
        const SizedBox(height: 15),
        Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: const Text("Continue"),
        )
      ],
    );
  }
}
