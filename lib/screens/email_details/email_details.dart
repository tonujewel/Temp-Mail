import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../models/home_hive_dm.dart';
import '../../utils/app_constant.dart';

class EmailDetailsScreen extends StatelessWidget {
  final HomeHiveDm data;
  const EmailDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.email)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/user.png',
                height: 40,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data.name} ",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Text(
                      "${AppConstant.getFormatedDate(data.createdAt)} ",
                      style: const TextStyle(fontSize: 12),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Text(AppConstant.convertToAgo(data.createdAt)),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            data.subject,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 20),
          MarkdownBody(
            data: data.body,
            selectable: true,
          )
        ],
      ),
    );
  }
}
