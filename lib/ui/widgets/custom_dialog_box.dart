import 'dart:ffi';

import 'package:clock_project/ui/widgets/custom_text_field.dart';
import 'package:clock_project/ui/widgets/custom_timer_column.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'custom_stack_divider.dart';

class CustomDialogs {
  final BuildContext context;
  CustomDialogs(this.context);

  late AlertDialog alert = AlertDialog(
    title: const Text('Do you want to delete?'),
    actions: [
      ElevatedButton(
          onPressed: () => Navigator.of(context).pop<bool>(false),
          child: const Icon(Icons.save)),
      ElevatedButton(
        onPressed: () => Navigator.of(context).pop<bool>(true),
        child: const Icon(Icons.remove),
      ),
    ],
  );

  Widget clockDialog(Function funTextField, List<Function> funs) {
    return SizedBox(
      child: SimpleDialog(
        contentPadding: PaddingItems().paddingContentDialog,
        titlePadding: PaddingItems().paddingDialogTitle,
        elevation: 15,
        title: const CustomStackDivider(),
        shape: Shapes().borderDialog,
        children: [
          CustomTextField(
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            labelText: 'Clock title',
            hintText: 'Clock title',
            fun: funTextField,
          ),
          Padding(
            padding: PaddingItems().paddingDialogTitle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTimerColumn(
                  text: 'Saat',
                  minValue: 0,
                  maxValue: 23,
                  funs: funs,
                  style: Theme.of(context).textTheme.headline6,
                ),
                CustomTimerColumn(
                  text: 'Dakika',
                  minValue: 0,
                  maxValue: 59,
                  funs: funs,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => Navigator.of(context).pop<bool>(true),
              child: IconItems().addIcon,
            ),
          ),
        ],
      ),
    );
  }
}
