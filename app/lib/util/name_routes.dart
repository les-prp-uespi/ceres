class Routes {
  // ignore: non_constant_identifier_names
  static final String LOGIN_VIEW = '/login';
  // ignore: non_constant_identifier_names
  static final String HOME_VIEW = '/home';
  // ignore: non_constant_identifier_names
  static final String RESOURCES_VIEW = '/resources';
  // ignore: non_constant_identifier_names
  static final String CREATE_RESERVATION_VIEW = '/reservation_create';
}

class RoutesHttp {
  static final String login = "https://api-ceres.herokuapp.com/auth/login/";
  static final String resources =
      "https://api-ceres.herokuapp.com/api/materiais/";
  static final String filterResourcesMobile =
      "https://api-ceres.herokuapp.com/api/materiais/tipo/M/";
  static final String filterResourcesImmobile =
      "https://api-ceres.herokuapp.com/api/materiais/tipo/I/";
  static final String createAcount =
      "http://ceres-uespi.herokuapp.com/api/v1/register/";
  static final String createReservation =
      "http://ceres-uespi.herokuapp.com/api/v1/reservas/";
  static final String updateReservation = "";
  static final String getReservations = "";
}
