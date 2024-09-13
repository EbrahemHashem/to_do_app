import 'package:audioplayers/audioplayers.dart';

void deleteSound() async {
  final audioPlayer = AudioPlayer();
  await audioPlayer.play(AssetSource('sounds/delete_sound.mp3'));
}
