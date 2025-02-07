import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PermissionController permissionController =
      Get.put(PermissionController());
  FlutterMidi flutterMidi = FlutterMidi();
  final SongController _songController = Get.put(SongController());
  final TearController _tearController = Get.put(TearController());
  void load() async {
    var byteData = await rootBundle.load('assets/Dan.sf2');
    await flutterMidi.prepare(sf2: byteData);
  }

  @override
  void initState() {
    super.initState();

    load();
    _songController.insertSongToJson();
    _tearController.loadExp();
    startTime();
  }

  dynamic startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, () async {
      permissionController.permission();
      await Get.off(MainScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MctColor.lightYellow.getMctColor,
      body: Center(
        child: Container(
          color: MctColor.lightYellow.getMctColor,
          child: SvgPicture.asset(
            LOGO_SVG,
            width: 230.w,
            height: 70.h,
          ),
        ),
      ),
    );
  }
}
