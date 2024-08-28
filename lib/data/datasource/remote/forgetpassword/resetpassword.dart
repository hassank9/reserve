import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String users_password,String users_email ) async {
    var response = await crud.postData(AppLink.ResetPassword,
        {
          "statusCode": 0,
          "id": 0,
          "username": "string",
          "email": users_email,
          "phone": "string",
          "password": users_password,
          "users_approve": "string"
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}
