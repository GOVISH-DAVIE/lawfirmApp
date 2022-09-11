import 'package:flutter/material.dart';
import 'package:hrm_employee/state/geolocateProvider.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class MyAttendance extends StatefulWidget {
  const MyAttendance({Key? key}) : super(key: key);

  @override
  _MyAttendanceState createState() => _MyAttendanceState();
}

class _MyAttendanceState extends State<MyAttendance> {
  bool isOffice = true;
  bool ischecked = true;
  bool ischeckedOut = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<GeolocatorProvider>(
      builder: (context, geolocatorController, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Employee Directory',
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.history,
                  color: Colors.white,
                ),
              ),
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: kBgColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(14.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Location:',
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          geolocatorController.locationBusy
                              ? const CircularProgressIndicator()
                              : Flexible(
                                  child: Text(
                                    ' ${geolocatorController.positionLocation?.address}',
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                                ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              debugPrint(geolocatorController.position?.latitude
                                  .toString());
                              geolocatorController.getLocationDetails(
                                  geolocatorController.position?.latitude,
                                  geolocatorController.position?.longitude);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: kMainColor.withOpacity(0.1),
                              ),
                              child: const Icon(
                                Icons.rotate_right,
                                color: kMainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: context.width(),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Text(
                              'Choose your Attendance mode',
                              style: kTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: kMainColor),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color:
                                          isOffice ? Colors.white : kMainColor,
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: kMainColor,
                                          child: Icon(
                                            Icons.check,
                                            color: isOffice
                                                ? Colors.white
                                                : kMainColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          'Office',
                                          style: kTextStyle.copyWith(
                                              color: isOffice
                                                  ? kTitleColor
                                                  : Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 12.0,
                                        ),
                                      ],
                                    ),
                                  ).onTap(() {
                                    geolocatorController.checkIn();
                                    setState(() {
                                      isOffice = !isOffice;
                                      ischecked = true;
                                    });
                                  }),
                                  Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color:
                                          !isOffice ? Colors.white : kMainColor,
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: kMainColor,
                                          child: Icon(
                                            Icons.check,
                                            color: !isOffice
                                                ? Colors.white
                                                : kMainColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          'Out Side',
                                          style: kTextStyle.copyWith(
                                              color: !isOffice
                                                  ? kTitleColor
                                                  : Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 12.0,
                                        ),
                                      ],
                                    ),
                                  ).onTap(() {
                                    setState(() {
                                      isOffice = !isOffice;
                                    });
                                  }),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 10.0,
                            ),
                            // Text(
                            //   '${DateTime.parse(geolocatorController.checkingData!.checkin!)}',
                            //   style: kTextStyle.copyWith(color: kGreyTextColor),
                            // ),
                            geolocatorController.checkingData == null
                                ? SizedBox()
                                : Text(
                                    // '',
                                    DateFormat.yMMMMEEEEd().format(
                                        DateFormat("yyyy-MM-dd").parse(
                                            "${geolocatorController.checkingData?.checkin}")),
                                    style: kTextStyle.copyWith(
                                        color: kGreyTextColor),
                                  ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            geolocatorController.checkingData == null
                                ? SizedBox()
                                : Text(
                                    // '',
                                    '${DateFormat.jm().format(DateFormat("yyyy-MM-dd").parse(geolocatorController.checkingData!.checkin!))} ',
                                    style: kTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0),
                                  ),
                            Divider(),
                            geolocatorController.checkingData?.checkout == null
                                ? SizedBox()
                                : ListTile(
                                    title: Text(
                                      'Checkout Time',
                                      style: kTextStyle.copyWith(
                                        color: kAlertColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${DateFormat.jm().format(DateFormat("yyyy-MM-dd").parse(geolocatorController.checkingData!.checkout!))} ',
                                      style: kTextStyle.copyWith(
                                        color: kAlertColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                            const Divider(),
                            const SizedBox(
                              height: 15.0,
                            ),
                            InkWell(
                              onTap: () {
                                if (isOffice && !ischecked) {
                                  geolocatorController.checkIn();
                                  setState(() {
                                    ischecked = true;
                                    ischeckedOut = false;
                                  });
                                }
                                if (!isOffice && !ischeckedOut) {
                                  geolocatorController.checkIn();
                                  setState(() {
                                    ischecked = false;
                                    ischeckedOut = true;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: isOffice
                                      ? kGreenColor.withOpacity(0.1)
                                      : kAlertColor.withOpacity(0.1),
                                ),
                                child: CircleAvatar(
                                  radius: 80.0,
                                  backgroundColor:
                                      isOffice ? kGreenColor : kAlertColor,
                                  child: Text(
                                    isOffice
                                        ? ischecked
                                            ? 'Your Checked In'
                                            : 'Check In'
                                        : ischeckedOut
                                            ? 'You Check Out'
                                            : 'Check Out',
                                    style: kTextStyle.copyWith(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
