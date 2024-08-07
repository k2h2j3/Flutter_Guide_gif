import 'package:flutter/material.dart';
import 'package:guide_gif/appbar_skip_widget.dart';
import 'package:guide_gif/const/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GuideScreen(),
    );
  }
}

class GuideScreen extends StatefulWidget {
  GuideScreen({super.key});

  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  final PageController _controller = PageController();

  final List<Map<String, String>> guideData = [
    {
      'description': '1',
      'imagePath': 'assets/tutorial1.gif',
    },
    {
      'description': '2',
      'imagePath': 'assets/tutorial2.gif',
    },
    {
      'description': '3',
      'imagePath': 'assets/tutorial3.gif',
    },
    {
      'description': '튜토리얼 설명4',
      'imagePath': 'assets/tutorial4.gif',
    },
    {
      'description': '튜토리얼 설명5',
      'imagePath': 'assets/tutorial5.gif',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: const AppbarSkip(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: guideData.length,
              itemBuilder: (context, index) {
                final guide = guideData[index];
                return Column(
                  children: [
                    Center(
                      child: Text(
                        guide['description']!,
                        style: const TextStyle(
                          fontFamily: 'Pretendard',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        guide['imagePath']!,
                        width: 260,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _controller,
            count: guideData.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: EFT_GREEN,
              dotColor: Colors.white,
            ),
            onDotClicked: (index) {
              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          const SizedBox(height: 20),
          // SafeArea(
          //   child: SizedBox(
          //     width: 200,
          //     height: 50,
          //     child: ElevatedButton(
          //       onPressed: () {
          //         // skipTutorial();
          //         // Navigator.pushAndRemoveUntil(
          //         //   context,
          //         //   MaterialPageRoute(
          //         //     builder: (context) => TtsSettingsScreen(),
          //         //   ),
          //         //       (route) => false,
          //         // );
          //       },
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.green,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(12),
          //         ),
          //       ),
          //       child: const Text(
          //         '닫기',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 30.0,
          //           fontFamily: 'Pretendard',
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
