import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';
import 'package:technical_test/app/modules/home/views/third_view.dart';

class SecondView extends GetView<HomeController> {
  String count;
  SecondView({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final isPortret = Orientation.portrait;

    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () async {
          controller.getUsers(page: 2);
          Get.to(() => ThirdView());
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Orientation.portrait != isPortret
                ? 32
                : MediaQuery.of(context).size.width / 3,
            vertical: 30,
          ),
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xff0066D8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Show User',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Second Screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Number from First Page',
              ),
              Text(
                count,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
