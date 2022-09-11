import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class DailyWorkReport extends StatefulWidget {
  const DailyWorkReport({Key? key}) : super(key: key);

  @override
  _DailyWorkReportState createState() => _DailyWorkReportState();
}

class _DailyWorkReportState extends State<DailyWorkReport> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Add A file',
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Color(0xFFFAFAFA),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      // controller: _controllerUser,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'File Number',
                        hintText: 'File Number',
                        labelStyle: kTextStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      // controller: _controllerUser,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Ref Number',
                        hintText: 'Ref Number',
                        labelStyle: kTextStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      // controller: _controllerUser,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        hintText: 'Subject',
                        labelStyle: kTextStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Add FIle'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
