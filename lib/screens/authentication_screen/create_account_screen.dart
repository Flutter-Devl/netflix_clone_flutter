import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/screens/authentication_screen/sign_up_screen.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Center(
              child: Image.asset('assets/devices.png'),
            ),
          ),
          _bodyWidget(),
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "STEP 2 OF 3",
            style: TextStyle(fontSize: 15, color: Colors.grey[400]),
          ),
          const SizedBox(height: 15),
          const Text(
            "Create Your account.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            "Netflix is personalized for you. Use your email and create a password to watch Netflix on any device at any time.",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SignUpPage()));
            },
            child: Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const Text("CONTINUE"),
            ),
          )
        ],
      ),
    );
  }
}
