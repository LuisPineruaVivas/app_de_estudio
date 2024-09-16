import 'package:app_de_estudio/controllers/question_paper/question_paper_controller.dart';
import 'package:app_de_estudio/controllers/questions_controller.dart';
import 'package:app_de_estudio/controllers/zoom_drawer_controller.dart';
import 'package:app_de_estudio/screens/home/home_screen.dart';
import 'package:app_de_estudio/screens/home/main_screen.dart';
import 'package:app_de_estudio/screens/introduction/introduction.dart';
import 'package:app_de_estudio/screens/login/login_screen.dart';
import 'package:app_de_estudio/screens/question/check_answer_screen.dart';
import 'package:app_de_estudio/screens/question/question_screen.dart';
import 'package:app_de_estudio/screens/question/quiz_overview_screen.dart';
import 'package:app_de_estudio/screens/question/result_screen.dart';
import 'package:app_de_estudio/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(
            name: '/main_screen',
            page: () => const MainScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
        ),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
            name: QuestionScreen.routeName,
            page: () => const QuestionScreen(),
            binding: BindingsBuilder(() {
              Get.put<QuestionsController>(QuestionsController());
            })),
        GetPage(
            name: QuizOverviewScreen.routeName,
            page: () => const QuizOverviewScreen()),
        GetPage(name: ResultScreen.routeName, page: () => const ResultScreen()),
        GetPage(
            name: CheckAnswerScreen.routeName,
            page: () => const CheckAnswerScreen())
      ];
}
