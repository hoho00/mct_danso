import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DansoLearning extends StatelessWidget {
  final String subject;
  final String explanation;
  // final Image image;
  const DansoLearning({
    Key? key,
    required this.subject,
    required this.explanation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 312.h,
            width: 148.w,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(explanation,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                    )),
              ],
            ),
          ),
          Container(
            height: 360.h,
            width: 165.w,
            color: Colors.grey,
            child: Center(child: Text('사진1')),
          ),
        ],
      ),
    );
  }
}

class DansosubLearning extends StatelessWidget {
  final String explanation;
  const DansosubLearning({Key? key, required this.explanation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 340.h,
            width: 155.w,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(explanation,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                    )),
              ],
            ),
          ),
          Container(
            height: 360.h,
            width: 165.w,
            color: Colors.grey,
            child: Center(child: Text('사진1')),
          ),
        ],
      ),
    );
  }
}

Widget fingering() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(radius: 14, backgroundColor: Colors.black),
            SizedBox(
              width: 7.sp,
            ),
            Text("왼손", style: TextStyle(fontSize: 15.sp)),
            SizedBox(
              width: 7.sp,
            ),
            CircleAvatar(radius: 14, backgroundColor: Colors.grey),
            SizedBox(width: 7.sp),
            Text("오른손", style: TextStyle(fontSize: 15.sp)),
          ],
        ),
      ),
      Container(
        width: 320.w,
        height: 400.h,
        color: Colors.grey,
        child: Text("사진을 넣어주세요"),
      )
    ],
  );
}