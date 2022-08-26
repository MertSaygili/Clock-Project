import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/widgets/custom_expanded.dart';
import 'package:flutter/material.dart';

class StopWatchPageView extends StatefulWidget {
  const StopWatchPageView({Key? key}) : super(key: key);

  @override
  State<StopWatchPageView> createState() => _StopWatchPageViewState();
}

class _StopWatchPageViewState extends State<StopWatchPageView> {
  final PaddignItems _paddignItems = PaddignItems();
  final String _time = '00:00:00';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _paddignItems.paddingScreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomExpanded(
            flex: 3,
            child: ListView(
              children: [
                Padding(
                  padding: _paddignItems.paddingTimer,
                  child: Align(
                    child: Text(
                      _time,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomExpanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.grey,
                      elevation: 15,
                      padding: PaddignItems().paddingButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Sifirla'),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 203, 73, 226),
                        onPrimary: Colors.white,
                        elevation: 15,
                        padding: PaddignItems().paddingButton,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {},
                      child: const Text('Baslat')),
                ],
              )),
        ],
      ),
    );
  }
}
