import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/models/home_json.dart';
import 'package:netflix_clone_flutter/screens/home/video_player_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BannerSection(),
            SizedBox(height: 10),
            RowSection(
              title: "My List",
              videoList: mylist,
            ),
            RowSection(
              title: "Popular on Netflix",
              videoList: popularList,
            ),
            RowSection(
              title: "Trending Now",
              videoList: trendingList,
            ),
            RowSection(
              title: "Netflix Originals",
              videoList: originalList,
            ),
            RowSection(
              title: "Anime",
              videoList: animeList,
            ),
          ],
        ),
      ),
    );
  }
}

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.height - 80,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannerImage(),
          SizedBox(height: 10),
          BannerOptions(),
        ],
      ),
    );
  }
}

class BannerImage extends StatelessWidget {
  const BannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/banner.webp"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const BannerGradient(),
        const BannerText(),
      ],
    );
  }
}

class BannerGradient extends StatelessWidget {
  const BannerGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.85),
            Colors.black.withOpacity(0.0),
          ],
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class BannerText extends StatelessWidget {
  const BannerText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/title_img.webp",
            width: 300,
          ),
          const SizedBox(height: 15),
          const Text(
            "Exciting - Sci-Fi Drama - Sci-Fi Adventure",
            style: TextStyle(
              fontSize: 11,
            ),
          )
        ],
      ),
    );
  }
}

class BannerOptions extends StatelessWidget {
  const BannerOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BannerOption(icon: Icons.add, label: "My List"),
        PlayButton(),
        BannerOption(icon: Icons.info_outline, label: "Info"),
      ],
    );
  }
}

class BannerOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const BannerOption({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 25,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const VideoDetailPage(
              videoUrl: "assets/videos/video_1.mp4",
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Padding(
          padding: EdgeInsets.only(right: 13, left: 8, top: 2, bottom: 2),
          child: Row(
            children: [
              Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Play",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowSection extends StatelessWidget {
  final String title;
  final List<dynamic> videoList;

  const RowSection({super.key, required this.title, required this.videoList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RowSectionTitle(title: title),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(videoList.length, (index) {
              return VideoThumbnail(videoData: videoList[index]);
            }),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

class RowSectionTitle extends StatelessWidget {
  final String title;

  const RowSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class VideoThumbnail extends StatelessWidget {
  final Map<String, String> videoData;

  const VideoThumbnail({super.key, required this.videoData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const VideoDetailPage(
              videoUrl: "assets/videos/video_1.mp4",
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          width: 110,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage(videoData['img'] ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
