import 'dart:developer';

import 'package:jian_ti/dataClass/data_manager.dart';
import 'package:flutter/material.dart';

Future<void> cleanSubjectFaultBookDLG(context, int subjectIndex) async {
  bool? result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(DataManager.subjects[subjectIndex].name),
            content: const Text('你确定要清空错题本吗？（该操作不可撤销！）'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('取消')),
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('清除'))
            ],
          ));

  if (result ?? false) {
    log('1');
    DataManager.cleanSubjectFaultBook(subjectIndex);
  }
}
