import 'package:iwksensor/ui/shared/ui_helper.dart';
import 'package:iwksensor/ui/widgets/card_view.dart';
import 'package:iwksensor/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initState(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("ENVIROMENTAL SENSOR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
            child: ListView.builder(
              reverse: true,
              itemCount: model.device.length,
              shrinkWrap: true,
              controller: model.scrollController,
              itemBuilder: (context,idx){
                return CardView(device: model.device[idx]);
              },
            )
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                model.scroll();
              },
              isExtended: true,
              tooltip: 'Scroll to Top',
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_upward,color: Colors.amber),
            ),
            verticalSpaceSmall,
            FloatingActionButton(
              onPressed: (){model.resetData(); },
              backgroundColor: Colors.white,
              child: Text("RESET", style: TextStyle(color: Colors.amber),),
            ),
          ],
        ),
      ),
    );
  }
}