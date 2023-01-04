// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import '../screens/helpers/local_storage_helper.dart';

class SwitchController extends GetxController {
  var dayOfWeek = 'Sunday'.obs;
  var activitySorting = 'Keep in place'.obs;
  var todoSorting = 'Alphabetical'.obs;
  var habbitSorting = 'Alphabetical'.obs;
  var textSizing = 'Default'.obs;
  RxBool SwichChange = true.obs;
  RxBool CollapseSwichChange = true.obs;
  RxBool SwipSwichChange = true.obs;
  RxBool AnimationSwichChange = true.obs;
  RxBool AwardsSwichChange = true.obs;
  RxBool NotifySwichChange = true.obs;
  RxBool RemindSwichChange = true.obs;
  RxBool LockPinSwichChange = true.obs;
  RxBool FingerSwichChange = true.obs;

  setAwardData() async {
    await LocalStorageHelper.setItem(
        "wantAward", AwardsSwichChange.value.toString());
  }

  setDayOfWeekData() async {
    await LocalStorageHelper.setItem("dayweek", dayOfWeek.value.toString());
  }

  setActivitySortingData() async {
    await LocalStorageHelper.setItem(
        "activitysort", activitySorting.value.toString());
  }

  setTextSizingData() async {
    await LocalStorageHelper.setItem("textsize", textSizing.value.toString());
  }

  setTodoSortingData() async {
    await LocalStorageHelper.setItem("todosort", todoSorting.value.toString());
  }

  setHabbitSortingData() async {
    await LocalStorageHelper.setItem(
        "habbitsort", habbitSorting.value.toString());
  }

  setAnimationData() async {
    await LocalStorageHelper.setItem(
        "wantAnimation", AnimationSwichChange.value.toString());
  }

  setCollapseData() async {
    await LocalStorageHelper.setItem(
        "wantCollapse", CollapseSwichChange.value.toString());
  }

  setVibrationData() async {
    await LocalStorageHelper.setItem(
        "wantVibration", SwichChange.value.toString());
  }

  setSwapData() async {
    await LocalStorageHelper.setItem(
        "wantSwap", SwipSwichChange.value.toString());
  }

  getFromLoacal() async {
    var val = await LocalStorageHelper.getItem('wantAward');
    var animation = await LocalStorageHelper.getItem('wantAnimation');
    var collapse = await LocalStorageHelper.getItem('wantCollapse');
    var vibrate = await LocalStorageHelper.getItem('wantVibration');
    var swap = await LocalStorageHelper.getItem('wantSwap');
    var dayweek = await LocalStorageHelper.getItem('dayweek');
    dayOfWeek.value = dayweek ?? 'Sunday';
    var activitySort = await LocalStorageHelper.getItem('activitysort');
    activitySorting.value = activitySort ?? 'Keep in place';
    var todosort = await LocalStorageHelper.getItem('todosort');
    todoSorting.value = todosort ?? 'Alphabetical';
    var habbitsort = await LocalStorageHelper.getItem('habbitsort');
    habbitSorting.value = habbitsort ?? 'Alphabetical';
    var textsize = await LocalStorageHelper.getItem('textsize');
    textSizing.value = textsize ?? 'Default';

    if (val == 'false') {
      AwardsSwichChange.value = false;
    } else {
      AwardsSwichChange.value = true;
    }
    if (animation == 'false') {
      AnimationSwichChange.value = false;
    } else {
      AnimationSwichChange.value = true;
    }
    if (collapse == 'false') {
      CollapseSwichChange.value = false;
    } else {
      CollapseSwichChange.value = true;
    }
    if (vibrate == 'false') {
      SwichChange.value = false;
    } else {
      SwichChange.value = true;
    }
    if (swap == 'false') {
      SwipSwichChange.value = false;
    } else {
      SwipSwichChange.value = true;
    }
  }

  @override
  void onInit() {
    getFromLoacal();
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
  }
}
