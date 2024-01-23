import 'package:flutter/material.dart';
import 'package:snusyoulooseflutter/Config/app_strings.dart';

class StepFourWidget extends StatefulWidget {
  const StepFourWidget({super.key});

  @override
  State<StepFourWidget> createState() => _StepFourWidgetState();
}

class _StepFourWidgetState extends State<StepFourWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {},
                  child: const Column(
                    children: [
                      Text(
                        AppStrings.appMode,
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Text(
                          AppStrings.explainAppMode,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Column(
                      children: [
                        Text(
                          AppStrings.dateMode,
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4, bottom: 4),
                          child: Text(
                            AppStrings.explainDateMode,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
