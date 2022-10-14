import 'dart:developer';

import 'package:get/get.dart';

import '../../Dialogue/subject/subject_dlg.dart';
import '../../dataClass/data_manager.dart';

import '../../dataClass/subject.dart';
import '../../pages/practice_page/practice_page_view.dart';
import '../../pages/section_page/section_page_view.dart';

class SubjectCardLogic extends GetxController {
  final int index;
  late Subject subject;
  late String name;
  late String progressInfo;
  late int faultbookNum;

  SubjectCardLogic(this.index) {
    updateData();
  }

  void updateData() {
    try {
      subject = DataManager.subjects[index];
      name = subject.name;
      progressInfo = DataManager.getProgressStr(index);
      faultbookNum = subject.getFaultBookLenght();
    } on RangeError {
      log('删除末尾元素');
    }

    update();
  }

  void onCardLongTap(contex) async {
    await subjectDLG(contex, index);
    updateData();
  }

  void onFaultBookReviewTap() async {
    await Get.to(PracticePageView(subjectIndex: index, sectionIndex: -1));
    updateData();
  }

  Future<void> onPracticeTap() async {
    await Get.to(SectionPageView(
      subjectIndex: index,
    ));

    updateData();
  }
}
