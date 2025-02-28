import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';

class ThirdView extends GetView<HomeController> {
  const ThirdView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isPortret = Orientation.portrait;

    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          controller.getUsers(page: -1);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
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
              'Get Error From API',
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
        title: Text('Third Screen'),
      ),
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: controller.isLoading.value
                ? Center(
                    child: const CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.userModel.value.data!.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        '${controller.userModel.value.data![index].firstName} ${controller.userModel.value.data![index].lastName}',
                      ),
                      subtitle:
                          Text(controller.userModel.value.data![index].email),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          controller.userModel.value.data![index].avatar,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
