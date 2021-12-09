import 'package:get/get.dart';
import 'package:project_danso/db/db_helpers.dart';
import 'package:project_danso/models/models.dart';

class AudioAndVideoDBController extends GetxController {
  void putAudioAndVideoRecordDB(
      {required songId, required exerType, required exerPath}) {
    // song_id, exer_type, exer_path, exer_time
    var date = DateTime.now().toString();
    DBHelPer().insertExerData(ExerciseModel(
      songId: songId,
      exerType: exerType,
      exerPath: exerPath,
      exerTime: date,
    ));
    print('저장된 songId : $songId');
  }

  void getAudioRecordPath() {
    // /var/mobile/Containers/Data/Application/6CD7224B-2AE9-4E84-B8AA-28B3843A161A/Documents/flutter_audio_recorder_1638847161594.m4a
  }
}