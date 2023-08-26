import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/screens/authentication_screen/sign_in_screen.dart';
import 'package:netflix_clone_flutter/models/onboarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _onBoardingData = OnBoardingEntity.onBoardingData;
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: _onBoardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemBuilder: (ctx, index) {
              final isLastPage = index == 3;
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  if (!isLastPage)
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Image.asset(_onBoardingData[index].image),
                    ),
                  if (isLastPage)
                    SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        _onBoardingData[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (isLastPage)
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(.5),
                            Colors.black.withOpacity(.1),
                            Colors.black.withOpacity(.9),
                          ],
                          tileMode: TileMode.clamp,
                          begin: const Alignment(0.9, 0.0),
                          end: const Alignment(0.8, 0.4),
                        ),
                      ),
                    ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 230, left: 40, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _onBoardingData[index].heading,
                          style: const TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _onBoardingData[index].description,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _onBoardingData.map(
                    (data) {
                      final index = _onBoardingData.indexOf(data);
                      return Container(
                        height: 10,
                        width: 10,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: index == _currentPageIndex
                              ? Colors.red
                              : Colors.grey,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignInPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 40, right: 15, left: 15),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.red,
                    ),
                    child: const Text("GET STARTED"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
