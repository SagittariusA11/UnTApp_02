
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:unt_02/views/Anonynmous_main_screen.dart';
//
// import '../controller/data_controller.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final DataController controller = Get.put(DataController());
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await controller.getUserProfileData();
//       setState(() {});
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  screen2();
//
//   }
// }
