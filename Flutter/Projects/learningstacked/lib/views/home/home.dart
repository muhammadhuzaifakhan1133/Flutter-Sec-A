import 'package:flutter/material.dart';
import 'package:learningstacked/viewmodels/home/home.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (HomeViewModel viewModel) => viewModel.add(),
        builder:
            (BuildContext context, HomeViewModel viewModel, Widget? child) =>
                Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${viewModel.counter}"),
                        ElevatedButton(
                          onPressed: () {
                            viewModel.add();
                          },
                          child: Text("Add"),
                        )
                      ],
                    ),
                  ),
                ));
  }
}
