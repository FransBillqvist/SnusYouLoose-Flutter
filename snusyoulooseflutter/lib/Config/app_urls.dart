class AppUrls {
  static const _url = 'http://192.168.0.10:5126';

  static const loginGateway = '$_url/api/v1/Auth/login';
  static const fetchUserGateway = '$_url/api/v2/User/Get/';
  static const fetchHabitGateway = '$_url/api/v2/Habit/GetDto/';
  static const fetchUsersInventory =
      '$_url/api/v2/CurrentSnuff/GetSnuffInventory/';
  static const fetchSnuff = '$_url/api/v2/Snuff/Get/';
  static const createHabitGateway = '$_url/api/v2/Habit/CreateV2/';
  static const fetchUserProgression =
      '$_url/api/v2/Progression/GetProgressionDto/';
  static const postSnuffTaken = '$_url/api/v2/CurrentSnuff/NewSnuffLogV2?';
  static const fetchSnuffShop = '$_url/api/v2/Snuff/GetShopSnuffs';
  static const fetchSnuffViaId = '$_url/api/v2/Snuff/Get/';
  static const postForMoreSnuff = '$_url/api/v2/CurrentSnuff/CreateV2';
  static const postNewProgression =
      '$_url/api/v2/Progression/CreateUserProgressionV2/';
  static const fetchTimeToNextDose =
      '$_url/api/v2/Progression/TimeToNextDoseV2/';

  static const createAuthUser = '$_url/api/v1/Auth/register';
  static const createUser = '$_url/api/v2/User/CreateV2';
  static const postCSToArchive =
      '$_url/api/v2/CurrentSnuff/AddCurrentSnuffToArchive/';
  static const fetchUsedNLeftSnuff =
      '$_url/api/v2/Progression/GetUseAndLimitValues/';
}
