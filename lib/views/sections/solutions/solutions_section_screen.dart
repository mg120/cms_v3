import 'package:flutter/material.dart';

import '../../../widgets/app_bar_widget.dart';
import 'solutions_section.dart';

class SolutionsSectionScreen extends StatelessWidget {
  const SolutionsSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    appBar: AppBarWidget(title: "Solutions Section",),
    body: SolutionsSections(),
    );
  }
}
