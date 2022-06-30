import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:temp_mail/screens/home_screen/home_controller.dart';
import 'package:temp_mail/utils/appConstant.dart';
import 'package:temp_mail/widgets/custom_progress.dart';

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
              appBar: AppBar(title: const Text('Inbox')),
              body: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: controller.emailList!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${controller.emailList![index].from!.name} ",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                              ),
                              Text(AppConstant.convertToAgo(
                                  "${controller.emailList![index].createdAt}")),
                            ],
                          ),
                          Text("${controller.emailList![index].subject}"),
                          Text(
                            "${controller.emailList![index].intro}",
                            maxLines: 1,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
