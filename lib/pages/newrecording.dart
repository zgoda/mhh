import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mhh/models.dart';

const defaultTextfieldInsets = EdgeInsets.fromLTRB(20, 15, 20, 15);
const defaultFieldSpacer = SizedBox(height: 25);

class RecordingCreateScreen extends HookConsumerWidget {
  const RecordingCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final recordDateController = useTextEditingController(text: now.toString());
    final recordSysPressureController = useTextEditingController();
    final recordDiaPressureController = useTextEditingController();
    final recordPulseController = useTextEditingController();
    final recordTimeOfDay = useState(RecordTimeOfDay.getByTime(now));
    final timesOfDay = RecordTimeOfDay.values.map(
      (e) => e.value,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Blood Pressure Record'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).dialogBackgroundColor,
            ),
            child: const Text('Save'),
          )
        ],
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
            Container(
              padding: defaultTextfieldInsets,
              child: DropdownButton(
                hint: const Text('Time of day'),
                value: recordTimeOfDay.value.value,
                isExpanded: true,
                items: timesOfDay.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (String? value) {
                  recordTimeOfDay.value = RecordTimeOfDay.getByValue(value!)!;
                },
              ),
            ),
            defaultFieldSpacer,
            TextField(
              keyboardType: TextInputType.number,
              controller: recordSysPressureController,
              autofocus: true,
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
            defaultFieldSpacer,
            TextField(
              keyboardType: TextInputType.number,
              controller: recordPulseController,
              decoration: const InputDecoration(
                labelText: 'Pulse',
                hintText: 'Heart beat rate (pulse)',
                contentPadding: defaultTextfieldInsets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
