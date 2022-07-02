import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_mail/screens/email_details/email_details.dart';
import 'package:temp_mail/screens/home_screen/home_controller.dart';
import 'package:temp_mail/utils/app_constant.dart';
import 'package:temp_mail/widgets/custom_progress.dart';
import '../../models/home_hive_dm.dart';
import '../../widgets/no_email_widget.dart';
import '../../widgets/no_internet_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return CustomProgress(
            isLoading: controller.isLoading,
            child: Scaffold(
              backgroundColor: const Color(0xFFF2F4FA),
              appBar: AppBar(
                title: const Text('Inbox'),
                actions: [
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'Logout') {
                        controller.logoutAction(context);
                      }
                    },
                    offset: Offset(0.0, AppBar().preferredSize.height),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    itemBuilder: (ctx) => [
                      const PopupMenuItem(
                        value: 'Logout',
                        child: Text("Logout"),
                      )
                    ],
                  )
                ],
              ),
              body: controller.noInternet
                  ? const NoInternetWidget()
                  : controller.emailList.isEmpty
                      ? const NoMailWidget()
                      : ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: controller.emailList.length,
                          itemBuilder: (context, index) {
                            return MailListItem(
                              data: controller.emailList[index],
                            );
                          }),
            ),
          );
        });
  }
}

class MailListItem extends StatelessWidget {
  final HomeHiveDm data;
  const MailListItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => EmailDetailsScreen(data: data)),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${data.name} ",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
                Text(AppConstant.convertToAgo(data.createdAt)),
              ],
            ),
            const SizedBox(height: 10),
            Text(data.email),
            const SizedBox(height: 10),
            Text(data.subject),
            const SizedBox(height: 10),
            Text(
              data.body,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
