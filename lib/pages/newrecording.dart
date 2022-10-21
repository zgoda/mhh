import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const defaultTextfieldInsets = EdgeInsets.fromLTRB(20, 15, 20, 15);
const defaultFieldSpacer = SizedBox(height: 25);

class RecordingCreateScreen extends HookConsumerWidget {
  const RecordingCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordDateController =
        useTextEditingController(text: DateTime.now().toString());
    final recordSysPressureController = useTextEditingController();
    final recordDiaPressureController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Blood Pressure Record'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DateTimePicker(
              controller: recordDateController,
              decoration: const InputDecoration(
                labelText: 'Date',
                hintText: 'Record date',
                contentPadding: defaultTextfieldInsets,
              ),
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
            ),
            defaultFieldSpacer,
            TextField(
              keyboardType: TextInputType.number,
              controller: recordSysPressureController,
              decoration: const InputDecoration(
                labelText: 'SYS',
                hintText: 'Systolic blood pressure (SYS)',
                contentPadding: defaultTextfieldInsets,
              ),
            ),
            defaultFieldSpacer,
            TextField(
              keyboardType: TextInputType.number,
              controller: recordDiaPressureController,
              decoration: const InputDecoration(
                labelText: 'DIA',
                hintText: 'Diastolic blood pressure (DIA)',
                contentPadding: defaultTextfieldInsets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
