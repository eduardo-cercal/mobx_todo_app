import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = "";
  @observable
  String pass = "";
  @observable
  bool passVisible = false;
  @observable
  bool loading = false;
  @observable
  bool loggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPass(String value) => pass = value;

  @action
  void togglePassVisible() => passVisible = !passVisible;

  @action
  Future<void> login() async {
    loading = true;
    //process...
    await Future.delayed(const Duration(seconds: 2));
    //process...
    loading = false;
    loggedIn = true;
    email = "";
    pass = "";
  }

  @action
  void logout() {
    loggedIn = false;
  }

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isPassValid => pass.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPassValid;
}