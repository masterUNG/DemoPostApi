// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demopostapi/utility/app_constant.dart';
import 'package:demopostapi/utility/app_controller.dart';
import 'package:demopostapi/utility/app_service.dart';
import 'package:demopostapi/widgets/widget_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'package:demopostapi/widgets/widget_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  TextEditingController textEditingController = TextEditingController();
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            displayForm(),
            const SizedBox(
              height: 16,
            ),
            Obx(() {
              return appController.dataModels.isEmpty
                  ? const SizedBox()
                  : ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: appController.dataModels.length,
                      itemBuilder: (context, index) => GFAccordion(
                        title: appController.dataModels[index].location,
                        // content: appController.dataModels[index].event_name,

                        textStyle: AppConstant().sirachaStyle(),

                        contentChild: Text(
                          appController.dataModels[index].event_name,
                          style: AppConstant().sirachaStyle(fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }

  WidgetForm displayForm() {
    return WidgetForm(
      textEditingController: textEditingController,
      hint: 'User Code',
      suffixWidget: GFIconButton(
        icon: const Icon(Icons.send),
        type: GFButtonType.outline,
        onPressed: () {
          if (textEditingController.text.isEmpty) {
            Get.snackbar('Have Space', 'Please Fill',
                snackPosition: SnackPosition.BOTTOM);
          } else {
            Get.dialog(WillPopScope(
              child: Center(
                child: LoadingAnimationWidget.flickr(
                    leftDotColor: Colors.deepOrange,
                    rightDotColor: Colors.green,
                    size: 36),
              ),
              onWillPop: () async {
                return false;
              },
            ));

            AppService().processAuthen(usercode: textEditingController.text);
          }
        },
      ),
    );
  }
}
