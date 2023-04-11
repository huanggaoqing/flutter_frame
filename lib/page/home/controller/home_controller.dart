import 'package:flutter_getx/page/home/model/detail_model.dart';
import 'package:flutter_getx/request/http_main.dart';
import 'package:flutter_getx/request/resp_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with HttpMain {

  HomeController();

  int count = 0;

  @override
  void onInit() {
    super.onInit();
  }

  void handleClickAdd() async {
    ++count;
    update();
    var resp = await request<Detail>()
      .setUrl("/adam/aiCourse/trainingData/details/1710")
      .format(Detail.fromJson)
      .registerErrorHandle(handleError)
      .start();
    print("resp${resp.result?.courseName}");
  }

  void handleError(Resp<Detail?> data) {
    print("handleError ${data.resCode} ==> ${data.resMsg}");
  }

  factory HomeController.get() {
    HomeController controller;
    if (!Get.isRegistered<HomeController>()) {
      controller = HomeController();
      Get.put(controller);
    } else {
      controller = Get.find<HomeController>();
    }
    return controller;
  }

}
