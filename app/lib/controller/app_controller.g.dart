// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on AppControllerBase, Store {
  Computed<int> _$resourcesLengthComputed;

  @override
  int get resourcesLength =>
      (_$resourcesLengthComputed ??= Computed<int>(() => super.resourcesLength,
              name: 'AppControllerBase.resourcesLength'))
          .value;

  final _$tokenAtom = Atom(name: 'AppControllerBase.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$completedAtom = Atom(name: 'AppControllerBase.completed');

  @override
  bool get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(bool value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  final _$resourcesAtom = Atom(name: 'AppControllerBase.resources');

  @override
  List<ResourceModel> get resources {
    _$resourcesAtom.reportRead();
    return super.resources;
  }

  @override
  set resources(List<ResourceModel> value) {
    _$resourcesAtom.reportWrite(value, super.resources, () {
      super.resources = value;
    });
  }

  final _$reservationsAtom = Atom(name: 'AppControllerBase.reservations');

  @override
  List<ReservationModel> get reservations {
    _$reservationsAtom.reportRead();
    return super.reservations;
  }

  @override
  set reservations(List<ReservationModel> value) {
    _$reservationsAtom.reportWrite(value, super.reservations, () {
      super.reservations = value;
    });
  }

  final _$getTokenAsyncAction = AsyncAction('AppControllerBase.getToken');

  @override
  Future getToken() {
    return _$getTokenAsyncAction.run(() => super.getToken());
  }

  final _$getResourcesAsyncAction =
      AsyncAction('AppControllerBase.getResources');

  @override
  Future getResources() {
    return _$getResourcesAsyncAction.run(() => super.getResources());
  }

  final _$getReservationsAsyncAction =
      AsyncAction('AppControllerBase.getReservations');

  @override
  Future getReservations() {
    return _$getReservationsAsyncAction.run(() => super.getReservations());
  }

  final _$loginAsyncAction = AsyncAction('AppControllerBase.login');

  @override
  Future login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  final _$createAccountAsyncAction =
      AsyncAction('AppControllerBase.createAccount');

  @override
  Future createAccount(String name, String email, String password) {
    return _$createAccountAsyncAction
        .run(() => super.createAccount(name, email, password));
  }

  final _$logoutAsyncAction = AsyncAction('AppControllerBase.logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$createReservationAsyncAction =
      AsyncAction('AppControllerBase.createReservation');

  @override
  Future<int> createReservation(ReservationModel reservationModel) {
    return _$createReservationAsyncAction
        .run(() => super.createReservation(reservationModel));
  }

  final _$updateReservationAsyncAction =
      AsyncAction('AppControllerBase.updateReservation');

  @override
  Future<int> updateReservation(ReservationModel reservationModel) {
    return _$updateReservationAsyncAction
        .run(() => super.updateReservation(reservationModel));
  }

  @override
  String toString() {
    return '''
token: ${token},
completed: ${completed},
resources: ${resources},
reservations: ${reservations},
resourcesLength: ${resourcesLength}
    ''';
  }
}
