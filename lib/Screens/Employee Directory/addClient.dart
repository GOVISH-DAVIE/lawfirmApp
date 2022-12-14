import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:hrm_employee/models/clients.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class AddClient extends StatefulWidget {
  const AddClient({Key? key}) : super(key: key);

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController firsname = TextEditingController();
  TextEditingController secondname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController slug = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController country = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset('images/emp1.png'),
          title: Text(
            '',
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                width: context.width(),
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Color(0xFFFAFAFA),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Personal Information',
                                  style: kTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                AppTextField(
                                  textFieldType: TextFieldType.NAME,
                                  readOnly: true,
                                  controller: firsname,
                                  decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'First Name',
                                    hintText: 'First Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                AppTextField(
                                  textFieldType: TextFieldType.NAME,
                                  readOnly: true,
                                  controller: secondname,
                                  decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Second  Name',
                                    hintText: 'Second Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                AppTextField(
                                  textFieldType: TextFieldType.NAME,
                                  readOnly: true,
                                  controller: lastname,
                                  decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Last  Name',
                                    hintText: 'Last Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                AppTextField(
                                  textFieldType: TextFieldType.EMAIL,
                                  readOnly: true,
                                  controller: email,
                                  decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Email Address',
                                    hintText: 'email',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                AppTextField(
                                  textFieldType: TextFieldType.PHONE,
                                  readOnly: true,
                                  controller: phone,
                                  decoration: const InputDecoration(
                                    labelText: 'Contact No.',
                                    hintText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                AppTextField(
                                  textFieldType: TextFieldType.NAME,
                                  readOnly: true,
                                  controller: company,
                                  decoration: const InputDecoration(
                                    labelText: 'Company',
                                    hintText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                AppTextField(
                                  textFieldType: TextFieldType.NAME,
                                  readOnly: true,
                                  controller: address,
                                  decoration: const InputDecoration(
                                    labelText: 'Address',
                                    hintText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                AppTextField(
                                  textFieldType: TextFieldType.NAME,
                                  readOnly: true,
                                  controller: TextEditingController(text: ''),
                                  decoration: const InputDecoration(
                                    labelText: 'Slung',
                                    hintText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      // KeyboardUtil.hideKeyboard(context);
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                      }
                                    },
                                    child: Text('submit'))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
