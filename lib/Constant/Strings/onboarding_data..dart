import 'package:learning_system/core/models/onboarding_model.dart';

class OnboardingData {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "مراجع متنوعة",
        description:
            "استمتع بالتعلم واستفد من الفرص المتاحة لك لا تفوت الفرصة لتحسين مهاراتك التعليمية والمعرفية",
        image: "assets/images/Education.gif"),
    OnboardingInfo(
        title: "دروس منظمة",
        description: "استعد للحصول على المعرفة والتعلم في أي وقت وفي أي مكان",
        image: "assets/images/Teaching.gif"),
    OnboardingInfo(
        title: "اختبارات مكثفة",
        description: "خذ خطوة إلى الأمام في تعليمك وتحدى نفسك لتحقيق المزيد",
        image: "assets/images/Online test.gif"),
  ];
}
