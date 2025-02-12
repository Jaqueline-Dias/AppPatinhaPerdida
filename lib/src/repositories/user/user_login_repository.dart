abstract interface class UserLoginRepository {
  Future execute(String email, String password);
}
