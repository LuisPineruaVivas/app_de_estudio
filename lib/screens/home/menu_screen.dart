import 'package:app_de_estudio/configs/themes/app_colors.dart';
import 'package:app_de_estudio/configs/themes/app_dark_theme.dart';
import 'package:app_de_estudio/configs/themes/ui_paramaters.dart';
import 'package:app_de_estudio/controllers/zoom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UiParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: const BoxDecoration(color: primaryColorDark),
      child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      backgroundColor: onSurfaceTextColor))),
          child: SafeArea(
              child: Stack(
            children: [
              BackButton(
                color: Colors.white,
                onPressed: () {
                  controller.toogleDrawer();
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Column(
                  children: [
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Text(
                              controller.user.value!.displayName ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  color: onSurfaceTextColor),
                            ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    _DrawerButton(
                        icon: Icons.web,
                        label: "website",
                        onPressed: () => controller.website()),
                    _DrawerButton(
                        icon: Icons.email,
                        label: "email",
                        onPressed: () => controller.email()),
                    _DrawerButton(
                        icon: Icons.library_books,
                        label: "Temas",
                        onPressed: () => controller.website()),
                    _DrawerButton(
                        icon: Icons.quiz,
                        label: "Quizzes",
                        onPressed: () => controller.website()),
                    const Spacer(flex: 4),
                    _DrawerButton(
                        icon: Icons.logout,
                        label: "Cerrar Sesion",
                        onPressed: () => controller.signOut()),
                  ],
                ),
              )
            ],
          ))),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {required this.icon, required this.label, this.onPressed});
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 25,
      ),
      label: Text(label),
      style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: onSurfaceTextColor),
    );
  }
}
