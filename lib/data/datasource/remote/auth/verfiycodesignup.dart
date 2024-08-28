import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(String users_email ,String users_verefiycode ) async {
    var response = await crud.postData(AppLink.Verfiycode, {
      "users_email" : users_email ,
      "users_verefiycode": users_verefiycode ,
    });
    return response.fold((l) => l, (r) => r);
  }


  resendData(String users_email)async{
    var response = await crud.postData(AppLink.resend,
        {
          "users_email": users_email,
          "users_verefiycode": 0
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}
