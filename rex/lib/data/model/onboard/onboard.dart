import 'package:rex/Utils/constants/onboard_constant.dart';

class Onboard {
  String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> onboarding = [
  Onboard(
      image:  OnboardConstant.bankingImage,
      title: OnboardConstant.bankingTitle,
      description: OnboardConstant.bankingDescription),
  Onboard(
      image: OnboardConstant.savingImage,
      title: OnboardConstant.savingTitle,
      description: OnboardConstant.savingDescription),
  Onboard(
      image: OnboardConstant.creditImage,
      title: OnboardConstant.creditTitle,
      description: OnboardConstant.creditDescription),
  Onboard(
      image: OnboardConstant.investmentImage,
      title: OnboardConstant.investmentTitle,
      description: OnboardConstant.investmentDescription)
];
