import 'package:flutter/material.dart';

FontWeight bold = FontWeight.bold;
//단소의 역사 설명
const String HISTORY =
    '단소는 대나무를 깎고, 구멍을 내서 부는 악기입니다. 소리가 맑고 청아하여 사람들에게 많은 사랑을 받고 있습니다. 단소가 역사책에 기록된 것은 오래되지 않았지만, 조상의 삶 속에서 널리 연주되었던 악기입니다.';

const String HISTORY_TITLE = '단소의 역사';
//평조 설명
const String DANSO_KIND =
    '단소는 경제단소와 평조단소로 나누어 집니다. 경제단소는 표준으로 사용하는 단소이고, 평조단소는 경제단소보다 길고 전체적으로 음정이 4도 낮습니다.';
const String DANSO_KIND_TITLE = '단소의  종류';

const String DANSO_PALY =
    '단소를 연주할 때 운지법(손가락 사용법)의 유의사항을 알아보고, 올바른 방법으로 연주 해 봅시다.';

const String DANSO_PALY_TITLE = '단소 연주시 운지법';

const String DANSO_UNM =
    '단소를 잘 불기 위해서는 입김의 세기, 양, 속도를 어떻게 해야 하는지 알아봅시다. 단소의 음들을 어떻게 분류할 수 있는지 알아보고 연주해 봅시다.';

const String DANSO_UNM_TITLE = '단소 음의 성질';

const String DANSO_SAME_UNM =
    '단소 연주를 할 때, 같은 음이 반복되는 때도 있습니다. 입김을 끊어서 연주하지 않으면서 같은 음을 구분하여 연주하는 방법을 익혀 봅시다.';

const String DANSO_SAME_UNM_TITLE = '단소의 동일음 주법';

const String DANSO_UNM_TEST =
    '단소 연주를 잘하기 위해 연습하는 방법을 알아봅시다. 차례가기, 두음 뛰어가기, 옥타브 연습 등 여러 가지 방법으로 연습해 봅시다.';

const String DANSO_UNM_TEST_TITLE = '단소음 연습 방법';

//단소잡는부분 설명
const String DANSO_CATCH =
    '단소 운지법, 율명, 악기 잡는 법, 중임무황태의 기본적인 소리 내는 방법에 관한 영상입니다.';
const String DANSO_CATCH2 =
    '단소 소리를 처음 내보려고 하는 학생들을 위한 영상으로 단소 소리내기에 관한 기초적이면서도 중요한 내용입니다.';
const String DANSO_CATCH_TITLE = '단소의 기본';
const String DANSO_CATCH2_TITLE = '단소 기초 소리 내기';

//단소연주자세 설명

const String BREATH =
    '단소 소리가 여전히 안 나는 학생들을 위한 영상입니다.입술위치, 떠는소리 내는 법, 호흡법과 관련된 내용이 담겨있습니다.';
const String BREATH_TITLE = '단소 호흡법';
const String BREATH2 =
    '단소를 불다 보면 호흡에 문제가 생겨서 완주하는데 어려움을 겪는 분들이 많습니다. 그런 분들을 위한 장기적인 호흡 연습 방법에 관한 내용입니다.';
const String BREATH2_TITLE = '복식호흡';

//단소 메인페이지 내용
//단소알아보기 설명
const List LOOK = ['단소의 역사, 종류에 대해', '알아볼까요?'];
//운지법 익히기 설명
const List LEARN = ['기초적인 단소의 운지법을', '연습해 보아요.'];
//연주곡 익히기 설명
const List PLAYLEARN = ['각 연주곡들을 연습하며 도전하고', '피드백을 받으세요'];
//질문하기 설명
const List QUESTIONS = ['단소에 대해 궁금하거나 어려움이', '있다면 이 곳에서 찾아보세요.'];
//기준은잡기
const List VOLUMECONTROL = ['단소를 불기 전에 필수로', '소리를 맞춰보아요.'];

//1~5단계 연습 리스트
// YulmyeongNote(Yulmyeong.tae,ScaleStatus.origin));//  율명하고 스캐일맞으면 참거짓 판명을해준다

const String level1 =
    't|o|o#t|o|o#t|o|o#t|o|^#t|o|t#t|o|t#t|o|t#t|o|^#t|t|o#t|t|o#t|t|o#t|o|^#t|o|o#t|o|t#t|t|t#t|o|^#';
const String level2 =
    't|o|o#h|o|o#m|o|o#h|o|^#t|h|m#h|t|^#m|h|t#h|m|^#h|t|t#h|o|^#t|t|h#m|o|^#m|m|h#h|o|^#t|o|t#t|o|^#';
const String level3 =
    't|h|m#h|t|J#Y|J|t#o|o|^#t|J|Y#J|t|h#m|h|t#o|o|^#m|h|t#J|Y|^#Y|J|t#h|m|^#m|m|h#h|t|t#J|J|Y#Y|o|^#';
const String level4 =
    'h|m|y#j|y|m#h|t|J#Y|o|^#h|t|J#Y|J|t#h|m|y#j|o|^#j|y|m#h|t|^#J|Y|J#t|h|^#j|j|y#y|m|m#h|t|J#Y|o|^#';
const String level5 =
    't|h|m#y|j|^#j|y|m#h|t|J#Y|M|H#T|o|^#T|H|M#Y|J|^#j|y|m#y|m|h#t|J|Y#M|o|^#Y|M|H#M|H|T#H|M|Y#J|o|^#';

const List TEAR_NAME = [
  '단소 입문자',
  '단소 초급자',
  '단소 중급자',
  '단소 상급자',
  '단소 숙련자',
  '단소 마스터',
];
//질문하기 페이지 부분
const List Q_AND_A_SUB_CONTANT = [
  '단소 소리는 나기 시작했는데, 소리가 유지가 안 되는 학생들을 위한 영상입니다. 유지가 되지 않는 원인을 찾고, 함께 해결해봅시다.',
  '연습을 통해서 소리가 났다 안 났다 거리는 게 소리를 나게 만드는 빈도를 올리는 과정입니다. 사람마다 입모양과 부는 스타일이 다 다르기 때문에 소리가 안 난다고 포기 내지 말고 꾸준히 스스로 분석하여 연습해야 합니다.',
  '단소는 바람을 전부 넣으면 소리가 나지 않습니다. 바람을 부는 각도를 대각선으로 맞추고 바람은 반은 나가고 반은 악기 속으로 들어가게 해야 소리가 잘 납니다.',
  '사람마다 입술의 모양이 다르기 때문에 입술을 내밀어야 소리가 나는 사람이 있어요. 그러기에 소리가 나면 상관이 없습니다.',
  '보편적으로 45도를 추천하지만 사람마다 입술의 모양이 다르기 때문에 자신에게 맞는 각도를 찾아서 불면 됩니다.단소 소리가 나면 상관이 없습니다.',
  '거울을 보면서 스스로 자신의 잘못된 부분을 찾고 고치는 게 나아갈 수 있게 하는 장기적으로 성장할 수 있습니다. 영상을 보면서도 잘 안되는 부분이 있다면 스스로 고민하고 관찰하여 찾는 것이 좋습니다.',
  '처음에 불 때에는 입모양을 소리가 나는 입모양으로 잘 불렀지만 숨을 쉬면서 모양이 흐트려지기 때문입니다. 거울로 입모양과 각도, 바람세기 등 어디가 잘못되었는지 체크하여 입술 모양을 유지해 봅시다.',
  '집과 학교는 건물 내의 부피 공간이 다르기 때문에 집보다 넓은 학교에서는 소리가 퍼지기 때문에 소리가 작게 들리는 것입니다.',
];

const List Q_AND_A_TITLE = [
  '복식호흡 유지를 어떻게 하나요?',
  '소리가 났다 안 났다 해요.',
  '악기에 바람을 어디다 넣나요?',
  '입술이 앞으로 나와도 되나요?',
  '각도를 다르게 해서 불어도 되나요?',
  '주변에 봐 줄 사람이없어요',
  '잘 불다가 숨쉬고 불면 소리가 안 나요',
  '집에선 잘 나는데 학교에선 잘 안나요.',
];

const List TIP_SUB_CONTANT = [
  '단소에서 높은 음, 낮은 음이 잘 안나는 학생들을 위한 영상입니다.',
  '단소 초급 탈출을 위한 장기적이고 스스로 할 수 있는 연습 방법과방향성에 대한 내용입니다.',
  '모든 손가락을 다 뗀 운지(태)는 소리가 잘 나는데 구멍을 막으면 소리가 안 나는 학생들을 위한 교육 내용을 담은 영상입니다.',
  '단소 소리가 맑지 않아서 고민이 많은 분들이 많습니다. 이번 영상은 악기 소리를 보다 깔끔하게 낼 수 있는 방법에 관한 내용입니다.',
  '곡 연주를 위한 매일 연습 팁을 담은 영상입니다. 여러 음을 연결하는 연습 방법에 관한 내용인데, 이 부분을 꾸준히 연습하면 보다 부드러운 소리로 아름다운 음악을 만드는 데 도움이 될 것입니다.',
];

const List TIP_TITLE = [
  '단소 소리 높낮이',
  '단소 초급 탈출하는 법!',
  '구멍을 막을때 소리가 안 난다면?',
  '맑은 소리를 내고싶어요!',
  '매일매일 연습하는 팁!',
];

enum DansoCode { joog, lim, moo, hawng, tae, highTae }

String getDansoCodeTitle(DansoCode dansoCode) {
  switch (dansoCode) {
    case DansoCode.joog:
      return '仲 / 㳞 (중)';
    case DansoCode.lim:
      return '林 / 淋 (임)';
    case DansoCode.moo:
      return '無 / 潕 (무)';
    case DansoCode.hawng:
      return '潢 / 㶂 (황)';
    case DansoCode.tae:
      return '汰 (태)';
    case DansoCode.highTae:
      return '㳲 (태)';

    default:
      return "";
  }
}

String getDansoCodeContant(DansoCode dansoCode) {
  switch (dansoCode) {
    case DansoCode.joog:
      return '1~4공까지의 지공을 막고, 5공은 열고 소리를 냅니다. 仲은 "낮은소리"를 낼 때의 입김으로,  㳞은 "가운데소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.lim:
      return '1~3공까지의  지공을 막고, 4공과 5공은 열고 소리를 냅니다. 林은 "낮은소리"를 낼 때의 입김으로,  淋은 "가운데소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.moo:
      return '1~2공까지의  지공을 막고, 3~5공은 열고 소리를 냅니다. 無는 "가운데소리"를 낼 때의 입김으로,  潕는 "높은소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.hawng:
      return '1공의  지공을 막고, 2~5공은 열고 소리를 냅니다. 潢은 "가운데소리"를 낼 때의 입김으로,  㶂은 "높은소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.tae:
      return '1~5공의 지공을 모두 열고  소리를 냅니다. 汰는 "가운데소리"를 낼 때의 입김으로 연주합니다.';
    case DansoCode.highTae:
      return '1공과 3공은 막고, 2공과 4공, 5공은 열고 소리를 냅니다. 㳲는 "높은소리"를 낼 때의 입김으로 연주합니다.';

    default:
      return "";
  }
}

String getDansoCodePng(DansoCode dansoCode) {
  switch (dansoCode) {
    case DansoCode.joog:
      return 'assets/images/danso_code/중.png';
    case DansoCode.lim:
      return 'assets/images/danso_code/임.png';
    case DansoCode.moo:
      return 'assets/images/danso_code/무.png';
    case DansoCode.hawng:
      return 'assets/images/danso_code/황.png';
    case DansoCode.tae:
      return 'assets/images/danso_code/태.png';
    case DansoCode.highTae:
      return 'assets/images/danso_code/높은_태.png';

    default:
      return "";
  }
} //운지법


