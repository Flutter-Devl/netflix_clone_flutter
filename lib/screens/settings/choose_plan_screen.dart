import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/screens/settings/plans_screen.dart';

class ChoosePlanPage extends StatefulWidget {
  const ChoosePlanPage({super.key});

  @override
  _ChoosePlanPageState createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset('assets/logo.png', width: 200, height: 200),
          ),
          _bodyWidget(),
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  border: Border.all(color: Colors.red, width: 1.5)),
              child: const Icon(Icons.done, size: 26, color: Colors.red),
            ),
            const SizedBox(height: 10),
            Text(
              "STEP 1 OF 3",
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),
            const SizedBox(height: 10),
            const Text(
              "Choose your plan.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _rowWidget(title: "No Commitments, cancel at any time."),
            const SizedBox(height: 10),
            _rowWidget(title: "Everything on Netflix for one low prince."),
            const SizedBox(height: 10),
            _rowWidget(title: "Unlimited viewing on all your devices."),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PlansPage()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: const Text("SEE THE PLANS"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rowWidget({String? title}) {
    return Row(
      children: [
        const Icon(Icons.done, color: Colors.red, size: 25),
        const SizedBox(width: 20),
        Text(title ?? '', style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
