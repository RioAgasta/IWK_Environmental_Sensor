import 'package:iwksensor/models/value_model.dart';
import 'package:iwksensor/ui/shared/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CardView extends StatelessWidget {
  final ValueModel device;
  const CardView({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.only(top: 5),
      height: 185,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Container(
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Column(
                children: [
                  Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '${device.date}  ${device.time}',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  verticalSpaceTiny,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/LogoPPTIK.png',
                                        width: 80,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('${device.valueSensor}°C',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text('${device.kelvin} K',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text('${device.fahrenheit}°F',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          // Text('${device.reamur}°R',
                                          //   style: TextStyle(
                                          //       color: Colors.grey,
                                          //       fontSize: 20,
                                          //       fontWeight: FontWeight.bold
                                          //   ),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                  verticalSpaceSmall,
                                  Container(
                                    child: Text(
                                      device.serial,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    )
                  ]
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
