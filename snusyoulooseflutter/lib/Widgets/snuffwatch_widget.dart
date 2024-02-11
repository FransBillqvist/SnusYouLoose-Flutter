import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:snusyoulooseflutter/Config/app_strings.dart';
import 'package:snusyoulooseflutter/Services/app_services.dart';

import '../Styles/app_colors.dart';

class SnuffWatchWidget extends StatefulWidget {
  SnuffWatchWidget({super.key});

  @override
  State<SnuffWatchWidget> createState() => _SnuffWatchWidgetState();
}

class _SnuffWatchWidgetState extends State<SnuffWatchWidget> {
  var defaultPadding = const EdgeInsets.all(5);
  @override
  Widget build(BuildContext context) {
    final userId = getUserIdService(context);
    var timeToNextDose;
    return FutureBuilder(
      future: timeToNextDose = fetchTimeToNextDose(userId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final listOfInts = splitDuration(snapshot.data);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading spinner while waiting
        } else if (snapshot.hasError) {
          return Text(''); // Show error if something went wrong
        } else {
          final streamDuration = StreamDuration(
            config: StreamDurationConfig(
              autoPlay: true,
              countDownConfig: CountDownConfig(
                duration: snapshot.data,
              ),
            ),
          );
          inspect(snapshot.data);
          return SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                streamDuration.remainingDuration.inSeconds > 0
                    ? Text(AppStrings.availableIn,
                        style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 23,
                            fontWeight: FontWeight.bold))
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: SlideCountdown(
                    duration: listOfInts.isEmpty
                        ? Duration.zero
                        : Duration(
                            hours: listOfInts[0],
                            minutes: listOfInts[1],
                            seconds: listOfInts[2]),
                    streamDuration: streamDuration,
                    slideDirection: SlideDirection.down,
                    style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                    replacement: Text(AppStrings.availableNow,
                        style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 23,
                            fontWeight: FontWeight.bold)),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.label_important_outline_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class ExampleControlDuration extends StatefulWidget {
  const ExampleControlDuration({super.key});

  @override
  State<ExampleControlDuration> createState() => _ExampleControlDurationState();
}

class _ExampleControlDurationState extends State<ExampleControlDuration> {
  late final StreamDuration _streamDuration;

  @override
  void initState() {
    super.initState();
    _streamDuration = StreamDuration(
      config: const StreamDurationConfig(
        countDownConfig: CountDownConfig(
          duration: Duration(days: 2),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamDuration.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Control Duration'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideCountdown(
              // This duration no effect if you customize stream duration
              streamDuration: _streamDuration,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _streamDuration.pause(),
              child: const Text('Pause'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _streamDuration.play(),
              child: const Text('Play'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // this will add 10 minutes to the remaining duration
                _streamDuration.add(const Duration(minutes: 10));
              },
              child: const Text('Add Duration'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // this will subtract 10 minutes to the remaining duration
                _streamDuration.subtract(const Duration(minutes: 10));
              },
              child: const Text('Subtract Duration'),
            ),
          ],
        ),
      ),
    );
  }
}
