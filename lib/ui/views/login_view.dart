import 'package:iwksensor/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iwksensor/ui/shared/ui_helper.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model)=>model.getTask(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Image.asset(
                            'assets/LogoPPTIK.png',
                            width: 80,
                          ),
                          horizontalSpaceMedium,
                          Text(
                            "LOGIN CREDENTIAL",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "User",
                          border: OutlineInputBorder(),
                          hintText: "ex: user",
                        ),
                        controller: model.userController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpaceMedium,
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          hintText: "ex: qwerty",
                          suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(
                              _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey,
                            ),
                          ),
                        ),
                        controller: model.passController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                      ),
                      verticalSpaceMedium,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Host",
                          border: OutlineInputBorder(),
                          hintText: "ex: iwkrmq.pptik.id",
                        ),
                        controller: model.hostController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpaceMedium,
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Virtual Host",
                            border: OutlineInputBorder(),
                            hintText: "ex: /User"
                        ),
                        controller: model.vhostController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpaceMedium,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Queues Device",
                          border: OutlineInputBorder(),
                          hintText: "ex: Log",
                        ),
                        controller: model.queuesSensorController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpaceMedium,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Guid Device",
                          border: OutlineInputBorder(),
                        ),
                        controller: model.guidController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              child: Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: const Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
                              ),
                              onPressed: () {
                                model.loginAccount(context);
                              }
                          ),
                          IconButton(
                              onPressed: () {
                                model.checkDataQr();
                              },
                              icon: Icon(Icons.qr_code_scanner, color: Colors.grey, size: 30,)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
          ),
        )
    );
  }
}
