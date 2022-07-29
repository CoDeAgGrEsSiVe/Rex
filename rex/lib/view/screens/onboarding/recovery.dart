import 'package:flutter/material.dart';
import 'package:rex/Utils/constants/onboard_constant.dart';

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
        Colors.white12,
        Colors.blueAccent,
      ])),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.end,
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
                          // backgroundColor: onboarding[index].backgroundColor,
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
                  SizedBox(
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
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.blue.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    // required this.backgroundColor,
  }) : super(key: key);

  final String image, title, description;
  // final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 16),
      Image.asset(
        image,
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 20),
      ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (rects) => LinearGradient(colors: [
          Colors.blue.withOpacity(0.5),
          Colors.black.withOpacity(0.8),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .createShader(rects),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 35,
              fontFamily: "Italic"),
        ),
      ),
      const SizedBox(height: 20),
      Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      const Spacer()
    ]);
  }
}

class Onboard {
  String image, title, description;
  // Color backgroundColor;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
    // required this.backgroundColor
  });
}

final List<Onboard> onboarding = [
  Onboard(
    image: OnboardConstant.bankingImage,
    title: OnboardConstant.bankingTitle,
    description: OnboardConstant.bankingDescription,
    // backgroundColor: Colors.blue
  ),
  Onboard(
    image: OnboardConstant.savingImage,
    title: OnboardConstant.savingTitle,
    description: OnboardConstant.savingDescription,
    // backgroundColor: Colors.green
  ),
  Onboard(
    image: OnboardConstant.creditImage,
    title: OnboardConstant.creditTitle,
    description: OnboardConstant.creditDescription,
    // backgroundColor: Colors.orange
  ),
  Onboard(
    image: OnboardConstant.investmentImage,
    title: OnboardConstant.investmentTitle,
    description: OnboardConstant.investmentDescription,
    // backgroundColor: Colors.white
  ),
];
