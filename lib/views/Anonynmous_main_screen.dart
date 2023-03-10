import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unt_02/views/rowlist.dart';


import '../controller/data_controller.dart';
import 'column_list.dart';

class screen2 extends StatefulWidget {
  @override
  _AnonynmousmainScreenWidgetState createState() =>
      _AnonynmousmainScreenWidgetState();
}

class _AnonynmousmainScreenWidgetState extends State<screen2> {
  final DataController controller = Get.put(DataController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getUserProfileData();
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator AnonynmousmainscreenWidget - FRAME

    return ScreenUtilInit(
      builder: (context, child) =>
          SafeArea(
            child: Scaffold(
                body: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(36, 20, 63, 1),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Text(
                            'Chat Anonymously with People',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Outfit',
                                fontSize: 24,
                                letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                  image: AssetImage(
                                    'assets/images/vector.png',
                                  )),
                              Text('0',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Outfit',
                                      fontSize: 24,
                                      letterSpacing:
                                      1 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1))
                            ],
                          ),
                          Text('+ Add Money',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Outfit',
                                  fontSize: 15,
                                  letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1)),
                          Container(
                              width: 390,
                              height: 700,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              child: Column(

                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            ' Favourites',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Color.fromRGBO(0, 0, 0, 1),
                                                fontFamily: 'Outfit',
                                                fontSize: 20,
                                                letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.bold,
                                                height: 1)),
                                      ),
                                    ),
                                    Row(
                                      children: [

                                        RelatedList(),

                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [

                                         chatlist(),

                                      ],
                                    )
                                  ]
                              )
                          ),
                        ]
                    )
                )
            ),
          ),
      designSize: const Size(380, 725),
    );
  }
}
