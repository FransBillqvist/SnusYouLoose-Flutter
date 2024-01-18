import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../Redux/actions.dart';
import '../Model/CurrentSnuff.dart';
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
    final userid = store.state.user?.UserId.toString();
    store.dispatch(getSnuffInventory(userid!));
    store.dispatch(getUserHabit(userid, context));
    // if (store.state.habit?.doseType == "ERROR") {
    //   Navigator.of(context).pushReplacementNamed(AppRoutes.habit);
    // }
    return Scaffold(
      body: SingleChildScrollView(
        child: StoreConnector<AppState, List<CurrentSnuffDto>>(
          converter: (store) => store.state.inventorySnuffs,
          builder: (context, List<CurrentSnuffDto> stateSnuff) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 164,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                "SNUS",
                style: TextStyle(color: AppColors.primary, fontSize: 48),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.74,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: InventoryWidget(currentSnuffs: stateSnuff)),
              ),
              ElevatedButton(
                onPressed: () async {
                  var store = StoreProvider.of<AppState>(context);
                  var current = store.state;
                  if (current.user != null) {
                    store.dispatch(SignOutUserAction(current.user!));
                    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                  } else {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                  }
                },
                child: Text(AppStrings.logout),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.example2,
                  foregroundColor: AppColors.textPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
