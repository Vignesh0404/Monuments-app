import 'package:flutter/material.dart';
import 'package:travelapp/screens/styles.dart';

Widget showDeleteAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Container(
            height: 165,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('Confirm Delete', style: titleFontStyle),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      width: double.infinity,
                      child: Text('Are you sure you want to delete the bookmark?',
                          style: grey14w400),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('CANCEL', style: cancelButtonText),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'DELETE',
                              style: deleteButtonText,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 15)
                ],
              ),
            ),
          ),
        );
      });
}
