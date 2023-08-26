import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/screens/settings/choose_plan_screen.dart';
import 'package:netflix_clone_flutter/screens/settings/plans_screen.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      elevation: 0.0,
      title: const Text(
        "My Settings",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(Icons.note),
              title: const Text(
                'My Plans',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: const Text("Choose the plan that's right for you."),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PlansPage()),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(Icons.note),
              title: const Text(
                'Choose plan',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: const Text("Choose your plan"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ChoosePlanPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
