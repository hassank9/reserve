
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String usersPassword,String usersEmail ) async {
    var response = await crud.postData(AppLink.Login, {
      "statusCode": 0,
      "id": 0,
      "username": "string",
      "email": usersEmail,
      "phone": "string",
      "password": usersPassword,
      "users_approve":"0"
    });
    return response.fold((l) => l, (r) => r);
  }
}
