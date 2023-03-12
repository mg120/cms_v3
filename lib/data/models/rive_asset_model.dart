import 'package:rive/rive.dart';

class RiveAsset {
  final String src, title, stateMachineName, artboard;
  final bool status;
  late SMIBool? input;

  RiveAsset(
      this.src, {
        required this.status,
        required this.title,
        required this.artboard,
        required this.stateMachineName,
        this.input,
      });

  set setInput(SMIBool status) {
    input = status;
  }
}