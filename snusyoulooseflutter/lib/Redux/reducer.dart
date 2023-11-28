import 'package:provider/provider.dart';

import 'actions.dart';
import 'app_state.dart';

AppState updatedSnuffReducer(AppState state, dynamic action) {
  if (action is UpdateSnuffAction) {
    action.updatedSnuff.selected = !action.updatedSnuff.selected;

    return AppState(
      snuffs: state.snuffs
          .map((snuff) => snuff.Brand == action.updatedSnuff.Brand
              ? action.updatedSnuff
              : snuff)
          .toList(),
    );
  }

  return state;
}
