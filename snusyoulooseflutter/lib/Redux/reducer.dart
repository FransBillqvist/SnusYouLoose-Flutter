import 'package:provider/provider.dart';

import 'actions.dart';
import 'app_state.dart';

AppState updatedSnuffReducer(AppState state, dynamic action) {
  if (action is UpdateSnuffAction) {
    return AppState(
      snuffs: state.snuffs
          .map((snuff) => snuff.Type == action.updatedSnuff.Type
              ? action.updatedSnuff
              : snuff)
          .toList(),
    );
  }

  return state;
}
