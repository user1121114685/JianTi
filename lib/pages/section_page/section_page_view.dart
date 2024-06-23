import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/theme.dart';
import '../practice_page/practice_page_view.dart';
import 'section_card/section_card_view.dart';
import 'section_page_logic.dart';

// ignore: must_be_immutable
class SectionPageView extends StatelessWidget {
  final int subjectIndex;
  late SectionPageLogic logic;
  SectionPageView({super.key, required this.subjectIndex});

  @override
  Widget build(BuildContext context) {
    logic = Get.put(SectionPageLogic(subjectIndex));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          logic.subjectName,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: GetBuilder<SectionPageLogic>(builder: (logic) => _buildBody()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MTheme.highLightColor,
        child: const Icon(Icons.build),
        onPressed: () => Get.to(PracticePageView(
          subjectIndex: subjectIndex,
          sectionIndex: -1,
        )),
      ),
      backgroundColor: MTheme.baseColor,
    );
  }

  Widget _buildBody() {
    List<Widget> silvers = [];
    for (int index = 0; index < logic.subject.sections.length; index++) {
      silvers.add(SliverToBoxAdapter(
        child: SectionCard(
          subjectIndex: subjectIndex,
          sectionIndex: index,
        ),
      ));
    }

    return Container(
      color: MTheme.baseColor,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: silvers,
            ),
          ),
        ],
      ),
    );
  }
}
