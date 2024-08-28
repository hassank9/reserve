
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String users_email ) async {
    var response = await crud.postData(AppLink.CheckEmail,
        {
        "statusCode": 0,
        "id": 0,
        "username": "string",
        "email" : users_email,
        "phone": "string",
        "password": "string",
        "users_approve": "string"
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}
