import 'package:flutter/material.dart';
import 'package:hrm_employee/Screens/Employee%20Directory/addClient.dart';
import 'package:hrm_employee/state/Client.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import 'employee_directory_details.dart';

class EmployeeDirectory extends StatefulWidget {
  const EmployeeDirectory({Key? key}) : super(key: key);

  @override
  _EmployeeDirectoryState createState() => _EmployeeDirectoryState();
}

class _EmployeeDirectoryState extends State<EmployeeDirectory> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClientsProvider>(
        builder: (context, clientsProviderController, child) {
      // clientsProviderController.getClients();
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              const AddClient().launch(context);
            },
            label: Row(
              children: const [Icon(Icons.add), Text('Add Client')],
            )),
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Clients Directory',
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: const [
            Image(
              image: AssetImage('images/employeesearch.png'),
            ),
          ],
        ),
        body: Column(
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
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    ...clientsProviderController.clients
                        .map(
                          (e) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: kGreyTextColor.withOpacity(0.5)),
                            ),
                            child: ListTile(
                              onTap: () {
                                EmployeeDetails(
                                  client: e,
                                ).launch(context);
                              },
                              leading: Image.asset('images/emp1.png'),
                              title: Text(
                                "${e.firstName} ${e.lastName}",
                                style: kTextStyle,
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                    '${e.email} ',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                  Text(
                                    '${e.phone} ',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ],
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: kGreyTextColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
