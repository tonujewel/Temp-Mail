import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:temp_mail/models/domains_dm.dart';

import '../../networking/api_manager.dart';
import '../../networking/url.dart';

class LoginController extends GetxController {
  var isLoading = false;

  String domainName = '';

  @override
  void onInit() {
    getDomains();
    super.onInit();
  }

  void getDomains() {
    isLoading = true;
    update();

    APIManager.getAPICall(url: URL.domainsUrl).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          DomainDm domainDm = domainDmFromJson(response);

          if (domainDm.hydraMember!.isNotEmpty) {
            domainName = "${domainDm.hydraMember![0].domain}";
          }

          update();
        }
      },
      onError: (error) {
        isLoading = false;
        update();
        print("ERROR::$error");
      },
    );
  }
}
