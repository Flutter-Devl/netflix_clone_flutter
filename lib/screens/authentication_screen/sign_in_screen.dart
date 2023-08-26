import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/screens/authentication_screen/create_account_screen.dart';
import 'package:netflix_clone_flutter/screens/home/main_dashboard.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset('assets/logo.png', width: 200, height: 200),
            _formWidget(),
          ],
        ),
      ),
    );
  }

  Widget _formWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                labelStyle: TextStyle(fontSize: 14, color: Colors.white),
                border: InputBorder.none,
                labelText: "Email or phone number",
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelStyle: TextStyle(fontSize: 14, color: Colors.white),
                border: InputBorder.none,
                labelText: "Password",
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MainDashboard()),
              );

            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey.shade600, width: 2)),
              child: const Text("Sign In"),
            ),
          ),
          const SizedBox(height: 20),
          const Text('OR'),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateAccountPage()),
              );
            },
            child: Container(
              height: 30,
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: const Text("SigUp"),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
