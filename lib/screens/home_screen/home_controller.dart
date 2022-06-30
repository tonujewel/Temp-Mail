import 'package:get/get.dart';
import 'package:temp_mail/main.dart';
import 'package:temp_mail/models/email_dm.dart';

import '../../networking/api_manager.dart';
import '../../networking/url.dart';
import '../../utils/appConstant.dart';

class HomeController extends GetxController {
  var isLoading = false;

  List<HydraMember>? emailList = [];

  @override
  void onInit() {
    getEmail();
    super.onInit();
  }

  void getEmail() {
    isLoading = true;
    update();

    var headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer ${prefs!.getString(AppConstant.tokenKey)}',
    };

    APIManager.getAPICall(url: URL.emailUrl, header: headers).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          EmailDm emailDm = emailDmFromJson(response);
          emailList = emailDm.hydraMember;

          update();
        }
      },
      onError: (error) {
        isLoading = false;
        update();
        errorSnackbar(error.toString());
      },
    );
  }
}
