class AppUrls {
  static const _url = 'http://192.168.0.10:5126';

  static const loginGateway = '$_url/api/v1/Auth/login';
  static const fetchUserGateway = '$_url/api/v2/User/Get/';
  static const fetchHabitGateway = '$_url/api/v2/Habit/GetDto/';
  static const fetchUsersInventory =
      '$_url/api/v2/CurrentSnuff/GetSnuffInventory/';
  static const fetchSnuff = '$_url/api/v2/Snuff/Get/';
  static const createHabitGateway = '$_url/api/v2/Habit/CreateV2/';
}
