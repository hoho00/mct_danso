import 'package:get/get.dart';

class PlayAndTestController extends GetxController {
  bool platState = false;
  String challengeButtonSwap = '도전하기';
  bool testState = false;
  bool testStartState = false;
  String testButtonswap = '연습하기';
  int statecount = 0;

  int test = 0;
  String krButton = '한자버전';
  bool krChanges = false;
  @override
  void onInit() {
    super.onInit();

    reset();
  }

  void reset() {
    platState = false;
    challengeButtonSwap = '도전하기';
    testState = false;
    testStartState = false;
    testButtonswap = '연습하기';
  }

  void changeKrState() {
    krChanges = !krChanges;
    krButton = krChanges ? '한글버전' : '한자버전';
    update();
  }

  void changePlayStopState() {
    platState = !platState;
    challengeButtonSwap = platState ? '중지' : '도전하기';
    update();
  }

  void testButtonState() {
    testState = !testState;
    challengeButtonSwap = testState ? '연습시작' : '도전하기';
    testButtonswap = testState ? '녹화' : '연습하기';
    update();
  }

  void testStartButtonState() {
    testStartState = !testStartState;
    challengeButtonSwap = testStartState ? '중지' : '연습시작';
    testButtonswap = testStartState ? '반주만' : '녹화하기';
    update();
  }

  void stateCountUp(int v) {
    statecount = v;
    update();
  }

  void stateCountTwo() {
    statecount = 0;
    reset();
  }

  void nextButton() {
    statecount++;

    update();
  }

  void previousButton() {
    statecount--;
    update();
  }
}

enum SongSpeed { eight, nine, ten, eleven, twelve }
