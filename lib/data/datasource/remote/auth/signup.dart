import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
   postdata(String usersName, String usersPassword, String usersEmail, String usersPhone) async {
    var response = await crud.postData(AppLink.signUp, {
      "users_id": 2,
      "users_name": usersName,
      "users_password": usersPassword,
      "users_email": usersEmail,
      "users_phone": usersPhone,
      "users_verefiycode": 0,
      "users_approve": 0
    });

    return response.fold((l) => l, (r) => r);
  }
}