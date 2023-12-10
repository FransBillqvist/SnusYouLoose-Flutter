import 'package:redux/redux.dart';
import 'app_state.dart';

void loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('dispatching ${action.runtimeType}');
  next(action);
  print('next state ${store.state}');
}
