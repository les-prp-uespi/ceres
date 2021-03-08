import 'package:mobx/mobx.dart';
import 'package:uespi_reserva/api/api_repository.dart';
import 'package:uespi_reserva/models/reservation_model.dart';
import 'package:uespi_reserva/models/resource_model.dart';
import 'package:uespi_reserva/util/local_store.dart';
part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  ApiRepository apiRepository;
  @observable
  String token;
  @observable
  bool completed = false;

  AppControllerBase(this.apiRepository) {
    getToken();
    getResources();
    getReservations();
  }

  @observable
  List<ResourceModel> resources = [];

  @observable
  List<ReservationModel> reservations = [];

  @computed
  int get resourcesLength => resources.length;

  @action
  getToken() async {
    token = await LocalStore.getString("token") ?? null;
    print(token);
  }

  @action
  getResources() async {
    
    resources = await apiRepository.getResources(token);
  }

  @action
  getReservations() async {
    completed = false;
    reservations = await apiRepository.getReservations(token);
    completed = true;
  }

  @action
  login(String email, String password) async {
    var response = await apiRepository.login(email, password);
    if (response["response"] != 404) {
      token = response["response"];
      await LocalStore.saveString("token", token);
    }
  }

  @action
  createAccount(String name, String email, String password) async {
    var response = await apiRepository.createAccount(name, email, password);
    if (response["token"] != null) {
      token = response["token"];
      await LocalStore.saveString("token", token);
      return 200;
    }
    return 401;  
  }

  @action
  logout() async {
    await LocalStore.remove("token");
    token = null;
  }

  @action
  Future<int> createReservation(ReservationModel reservationModel) async {
    //reservations.add(reservationModel);
    int r = await apiRepository.createReservation(reservationModel, token);
    if (r == 200) {
      reservations = await apiRepository.getReservations(token);
    }
    return r;
  }

  @action
  Future<int> updateReservation(ReservationModel reservationModel) async {
    int r = await apiRepository.updateReservation(reservationModel, token);
    if (r == 200) {
      reservations = await apiRepository.getReservations(token);
    }
    return r;
  }
}
