import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/app_buttons/app_elevated_button.dart';
import '../../widgets/app_text_field.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(title: "Contact Us",),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        children: [
          AppTextFormField(
            labelText: "name".tr,
            hintText: "enter_your_name".tr,
            showLabel: true,
            controller: nameController,
            keyboardType: TextInputType.name,
            validateEmptyText: 'name_required'.tr,
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            showLabel: true,
            labelText: "email".tr,
            hintText: "enter_your_email".tr,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validateEmptyText: 'email_required'.tr,
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            showLabel: true,
            labelText: "message".tr,
            hintText: "write_message_here".tr,
            controller: messageController,
            keyboardType: TextInputType.text,
            validateEmptyText: 'message_required'.tr,
            maxLines: 4,
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: size.width,
            height: 48,
            child: AppElevatedButton(
              text: "apply".tr,
              onPressed: (){},),
          ),
        ],
      ),
    );
  }
}
