import 'package:soar_quest/soar_quest.dart';
import 'firebase_options.dart';

void main() async {
  await SQApp.init("Course App",
      firebaseOptions: DefaultFirebaseOptions.currentPlatform);
  SQApp.run([Screen("Test Screen"), Screen("Test Screen 2")]);
}
