import '../Model/CurrentSnuff.dart';
import '../Model/Habit.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';
import 'actions.dart';
import 'app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    inventorySnuffs: snuffReducer(state.inventorySnuffs, action),
    selectedSnuff: snuffSelectedReducer(
        state.selectedSnuff ??
            Snuff("1", "Skruf", "Original Portion2", 50, 20,
                "assets/images/skruf.png", 1, false),
        action),
    habit: habitReducer(state.habit, action),
    user: userReducer(state.user, action),
  );
}

List<CurrentSnuff> snuffReducer(List<CurrentSnuff> snuffs, action) {
  if (action is UpdateSnuffAction) {
    return snuffs
        .map((snuff) => snuff.snusId == action.updatedSnuff.snusId
            ? action.updatedSnuff
            : snuff)
        .toList();
  }
  return snuffs; // Returnera den oförändrade listan om ingen action matchar
}

Snuff snuffSelectedReducer(Snuff state, dynamic action) {
  if (action is SelectSnuffAction) {
    return action.snuff;
  }
  return state;
}

Habit? habitReducer(Habit? habit, action) {
  if (action is CreateHabitAction) {
    // Logik för att skapa eller uppdatera en habit
  }
  return habit; // Returnera den oförändrade habit om ingen action matchar
}

User? userReducer(User? user, action) {
  if (action is SignInUserAction) {
    print('userReducer => SignInUserAction');
    return action.user;
  }

  if (action is SignOutUserAction) {
    print('userReducer => SignOutUserAction');
    return null;
  }
  return user; // Returnera den oförändrade användaren om ingen action matchar
}



// import 'package:provider/provider.dart';

// import 'actions.dart';
// import 'app_state.dart';




// AppState appReducer(AppState state, dynamic action) {
//   return AppState(
//     snuffs: updatedSnuffReducer(state.snuffs, action),
//     habit: updatedHabitReducer(state.habit, action),
//     user: updatedUserReducer(state.user, action),
//   )
// }

// AppState updatedSnuffReducer(AppState state, dynamic action) {
//   if (action is UpdateSnuffAction) {
//     return AppState(
//       snuffs: state.snuffs
//           .map((snuff) => snuff.Type == action.updatedSnuff.Type
//               ? action.updatedSnuff
//               : snuff)
//           .toList(),
//     );
//   }

//   return state;
// }
