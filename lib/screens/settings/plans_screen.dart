import 'package:flutter/material.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  int _selectedPlan = 0;

  final List<Map<String, dynamic>> _planOptions = [
    {
      'name': 'Basic',
      'price': ['Rs950', 'Rs1,200', 'Rs1,500'],
      'videoQuality': ['Good', 'Better', 'Best'],
      'resolution': ['480p', '1080p', '4k+HDR'],
      'screens': ['1', '2', '4'],
      'watchOnAnyDevice': [true, false, false],
    },
    {
      'name': 'Standard',
      'price': ['Rs950', 'Rs1,200', 'Rs1,500'],
      'videoQuality': ['Good', 'Better', 'Best'],
      'resolution': ['480p', '1080p', '4k+HDR'],
      'screens': ['1', '2', '4'],
      'watchOnAnyDevice': [false, true, false],
    },
    {
      'name': 'Premium',
      'price': ['Rs950', 'Rs1,200', 'Rs1,500'],
      'videoQuality': ['Good', 'Better', 'Best'],
      'resolution': ['480p', '1080p', '4k+HDR'],
      'screens': ['1', '2', '4'],
      'watchOnAnyDevice': [false, false, true],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("STEP 1 OF 3"),
              const SizedBox(height: 10),
              const Text(
                "Choose the plan that's right for you.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text("Downgrade or upgrade at any time."),
              const SizedBox(height: 15),
              _rowButtonWidget(),
              _plans(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowButtonWidget() {
    return Row(
      children: List.generate(
        _planOptions.length,
        (index) => Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedPlan = index;
              });
            },
            child: _singleRowButton(
              text: _planOptions[index]['name'],
              color: _selectedPlan == index ? Colors.red : Colors.red.shade300,
            ),
          ),
        ),
      ),
    );
  }

  Widget _singleRowButton({Color? color, String? text}) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: color,
      ),
      child: Text(
        text ?? '',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _plans() {
    final selectedPlanData = _planOptions[_selectedPlan];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          const Text("Monthly Price"),
          const SizedBox(height: 15),
          _buildPlanDetails(selectedPlanData['price']),
          const SizedBox(height: 15),
          const Text("Video Quality"),
          const SizedBox(height: 15),
          _buildPlanDetails(selectedPlanData['videoQuality']),
          const SizedBox(height: 15),
          const Text("Resolution"),
          const SizedBox(height: 15),
          _buildPlanDetails(selectedPlanData['resolution']),
          const SizedBox(height: 15),
          const Text("Screens you can watch on at the same time"),
          const SizedBox(height: 15),
          _buildPlanDetails(selectedPlanData['screens']),
          const SizedBox(height: 15),
          const Text("Watch on your laptop, TV, Phones and Tablet"),
          const SizedBox(height: 15),
          _buildPlanDetails(selectedPlanData['watchOnAnyDevice']),
          const SizedBox(height: 15),
          const Text("Unlimited films and TV Programmes"),
          const SizedBox(height: 15),
          _buildPlanDetails(selectedPlanData['watchOnAnyDevice']),
          const SizedBox(height: 15),
          const Text("Cancel at any time"),
          const SizedBox(height: 15),
          _buildPlanDetails(selectedPlanData['watchOnAnyDevice']),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPlanDetails(List<dynamic> data) {
    return Column(
      children: [
        Row(
          children: List.generate(
            data.length,
            (index) => Expanded(
              child: Center(
                child: Text(
                  data[index].toString(),
                  style: TextStyle(
                    color: _selectedPlan == index ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(thickness: 1.5)
      ],
    );
  }
}
