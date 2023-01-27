import 'package:drift/drift.dart';
import 'package:get/get.dart';
import 'package:habbit_app/controllers/addhabbit_controller.dart';
import 'package:habbit_app/infrastructure/model/habbit_checklist_model.dart';

class SearchController extends GetxController {
  AddHabbitSelectController habbitSelectController =
      Get.put(AddHabbitSelectController(), permanent: false);
  RxBool searchHome = false.obs;
  RxBool childrenAnimation = false.obs;
  RxString searchDropDown = 'All'.obs;
  var categoryId = 0.obs;
}
