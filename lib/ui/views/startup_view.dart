import 'package:iwksensor/ui/shared/ui_helper.dart';
import 'package:iwksensor/viewmodels/startup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) {
        model.startTimer();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      verticalSpaceMassive,
                      Center(child: Text('ENVIROMENTAL SENSOR',
                        style: TextStyle(color: Colors.amber, fontSize: 25, fontWeight: FontWeight.bold),
                      )
                      ),
                      verticalSpaceLarge,
                      Image.asset(
                        'assets/LogoPPTIK.png',
                        width: 150,
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.amber,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.amber),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}