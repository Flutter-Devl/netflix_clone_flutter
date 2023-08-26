import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/models/comming_Soon_josn.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      elevation: 0.0,
      title: const Text(
        "Coming Soon",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              comingSoonJson.length,
              (index) {
                return Column(
                  children: [
                    _buildComingSoonItem(comingSoonJson[index], context),
                    Divider(
                      color: Colors.white.withOpacity(0.3),
                      thickness: 0.5,
                      height: 0,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildComingSoonItem(Map<String, dynamic> item, BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildComingSoonImage(item['img']),
          if (item['duration']) _buildProgressIndicator(size),
          const SizedBox(height: 15),
          _buildComingSoonTitleImage(item['title_img']),
          _buildDateText(item['date']),
          _buildTitleText(item['title']),
          _buildDescriptionText(item['description']),
          _buildTypeText(item['type']),
        ],
      ),
    );
  }

  Widget _buildComingSoonImage(String imageUrl) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(Size size) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Stack(
          children: [
            Container(
              height: 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.withOpacity(0.7),
              ),
            ),
            Container(
              width: size.width * 0.34,
              height: 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red.withOpacity(0.8),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildComingSoonTitleImage(String titleImage) {
    return Image.asset(titleImage, width: 120);
  }

  Widget _buildDateText(String date) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        date,
        style: TextStyle(color: Colors.white.withOpacity(0.5)),
      ),
    );
  }

  Widget _buildTitleText(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDescriptionText(String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        description,
        style: TextStyle(height: 1.4, color: Colors.white.withOpacity(0.5)),
      ),
    );
  }

  Widget _buildTypeText(String type) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        type,
        style: TextStyle(
            fontSize: 12, height: 1.4, color: Colors.white.withOpacity(0.9)),
      ),
    );
  }
}
