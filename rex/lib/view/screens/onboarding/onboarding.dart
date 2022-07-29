import 'package:flutter/material.dart';
import 'package:rex/view/widgets/dot_indicator.dart';
import 'package:rex/data/model/onboard/onboard.dart';
import 'package:rex/view/content/onboarding_content.dart';
import 'package:rex/view/screens/auth/login/login.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white,
        Colors.white,
      ])),
      child: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 255, 114, 94),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const LoginScreen()));
                    },
                    child: ShaderMask(
                      shaderCallback: (rects) => LinearGradient(
                              colors: [
                            const Color.fromARGB(255, 255, 114, 94)
                                .withOpacity(0.2),
                            Colors.white.withOpacity(0.8),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(rects),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                itemCount: onboarding.length,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                      image: onboarding[index].image,
                      title: onboarding[index].title,
                      description: onboarding[index].description,
                    )),
          ),
          Row(
            children: [
              ...List.generate(
                  onboarding.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: DotIndicator(isActive: index == _pageIndex),
                      )),
              const Spacer(),
              _pageIndex != 3
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: ElevatedButton(
                          onPressed: (() {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 255, 114, 94),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(Icons.arrow_forward,
                              color: Colors.white),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: (() {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()));
                          }),
                          child: const Text("Get Started",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 255, 114, 94),
                              shape: const StadiumBorder()),
                        ),
                      ),
                    ),
            ],
          )
        ],
      ),
    ));
  }
}
