import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:snusyoulooseflutter/Services/app_services.dart';
import 'package:snusyoulooseflutter/Widgets/snuffwatch_widget.dart';
import 'package:snusyoulooseflutter/Widgets/useindicator_widget.dart';

import '../Redux/actions.dart';
import '../Widgets/inventory_widget.dart';
import '../Config/app_strings.dart';
import '../Model/CurrentSnuffDto.dart';
import '../Redux/app_state.dart';
import '../Redux/app_thunks.dart';
import '../Styles/app_colors.dart';
import '../Config/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final userid = getUserIdService(context);
    store.dispatch(getSnuffInventory(userid));
    store.dispatch(getUserHabit(userid, context));
    store.dispatch(getProgression(userid));
    store.dispatch(getDurationToNextPortion(userid));

    return StoreConnector<AppState, bool>(
        converter: (store) => store.state.getPregressionFailed,
        builder: (context, getPregressionFailed) {
          if (getPregressionFailed) {
            store.dispatch(createAPregression(userid));
          }

          return Scaffold(
            body: SingleChildScrollView(
              child: StoreConnector<AppState, List<CurrentSnuffDto>>(
                converter: (store) => store.state.inventorySnuffs,
                builder: (context, List<CurrentSnuffDto> stateSnuff) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                            top: 25, left: 18, child: UseIndicatorWidget()),
                        Positioned(
                          left: 76.5,
                          top: 75,
                          child: Container(
                              width: 259,
                              height: 150,
                              child: SnuffWatchWidget()),
                        ),
                        Positioned(
                          top: 20,
                          right: -24,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 48.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 530.0, left: 53),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.74,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: InventoryWidget(currentSnuffs: stateSnuff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            endDrawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      '${store.state.user?.FirstName}',
                      style: TextStyle(fontSize: 18),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.example2,
                    ),
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Text(AppStrings.shop, style: TextStyle(fontSize: 22)),
                        Padding(
                          padding: EdgeInsets.only(left: 38),
                          child: Icon(Icons.shopping_cart_rounded,
                              size: 30, color: AppColors.cartBgLight),
                        )
                      ],
                    ),
                    onTap: () {
                      // Update the state of the app
                      // Then close the drawer
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.shop);
                    },
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Text(
                          AppStrings.statistics,
                          style: TextStyle(fontSize: 22),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(Icons.bar_chart_rounded,
                              size: 30, color: AppColors.cartBgLight),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.statistics);
                    },
                  ),
                  ListTile(
                    title: const Row(
                      children: [
                        Text(
                          AppStrings.logout,
                          style: TextStyle(fontSize: 22),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(Icons.logout,
                              size: 30, color: AppColors.cartBgLight),
                        ),
                      ],
                    ),
                    onTap: () {
                      var current = store.state;
                      Navigator.pop(context);
                      store.dispatch(SignOutUserAction(current.user!));
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.login);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
