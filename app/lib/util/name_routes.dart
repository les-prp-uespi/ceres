class Routes {
  // ignore: non_constant_identifier_names
  static final String LOGIN_VIEW = '/login';
  // ignore: non_constant_identifier_names
  static final String HOME_VIEW = '/home';
  // ignore: non_constant_identifier_names
  static final String RESOURCES_VIEW = '/resources';
  // ignore: non_constant_identifier_names
  static final String CREATE_RESERVATION_VIEW = '/reservation_create';

  // ignore: non_constant_identifier_names
  static final String RESERVATION_VIEW = '/reservation';

  // ignore: non_constant_identifier_names
  static final String UPDATE_RESERVATION_VIEW = '/update_reservation';
}

class RoutesHttp {
  static final String login = "https://api-ceres.herokuapp.com/auth/login/";
  static final String resources =
      "https://api-ceres.herokuapp.com/api/materiais/";
  static final String filterResourcesMobile =
      "https://api-ceres.herokuapp.com/api/materiais/?search=M";
  static final String filterResourcesImmobile =
      "https://api-ceres.herokuapp.com/api/materiais/?search=I";
  static final String createAcount =
      "https://api-ceres.herokuapp.com/auth/registration/";
  static final String reservation =
      "https://api-ceres.herokuapp.com/api/reservas/";
  static final String updateReservation = "https://api-ceres.herokuapp.com/api/reservas/";
  static final String getReservations = "";
}
