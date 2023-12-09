import '../Model/Habit.dart';
import '../Model/Snuff.dart';
import '../Model/User.dart';
import 'actions.dart';
import 'app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    snuffs: snuffReducer(state.snuffs, action),
    habit: habitReducer(state.habit, action),
    user: userReducer(state.user, action),
  );
}

List<Snuff> snuffReducer(List<Snuff> snuffs, action) {
  if (action is UpdateSnuffAction) {
    return snuffs
        .map((snuff) => snuff.Type == action.updatedSnuff.Type
            ? action.updatedSnuff
            : snuff)
        .toList();
  }
  return snuffs; // Returnera den oförändrade listan om ingen action matchar
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
