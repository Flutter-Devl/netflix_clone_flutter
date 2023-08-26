import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/models/search_json.dart';
import 'package:netflix_clone_flutter/screens/home/video_player_screen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSearchField(),
          _buildBody(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Text(
        "Search",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.withOpacity(0.25),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Top Searches",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: _buildSearchItems(context),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSearchItems(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return List.generate(searchJson.length, (index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VideoDetailPage(
                videoUrl: searchJson[index]['video'],
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              _buildThumbnail(searchJson[index]['img']),
              const SizedBox(width: 10),
              _buildVideoInfo(size, searchJson[index]['title']),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildThumbnail(String imageUrl) {
    return Stack(
      children: [
        Container(
          height: 70,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image:
                DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 70,
          width: 120,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ],
    );
  }

  Widget _buildVideoInfo(Size size, String title) {
    return SizedBox(
      width: (size.width - 30) * 0.4,
      child: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}
