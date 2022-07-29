import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        // height: MediaQuery.of(context).size.height * 0.4,
        color: const Color.fromARGB(255, 255, 114, 94),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 16.0),
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 255, 114, 94),
            child: Image.asset(
              image,
              height: 400,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      SizedBox(
        width: double.infinity,
        height: 40.0,
        child: Image.asset(
          'assets/images/wave.png',
          height: 400,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(height: 20),
      ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (rects) => LinearGradient(colors: [
          const Color.fromARGB(255, 255, 114, 94),
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
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      const Spacer()
    ]);
  }
}
