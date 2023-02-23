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
            labelText: "Name",
            hintText: "Enter your name",
            showLabel: true,
            controller: nameController,
            keyboardType: TextInputType.name,
            validateEmptyText: 'name_required'.tr,
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            showLabel: true,
            labelText: "Email",
            hintText: "Enter your email",
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validateEmptyText: 'email_required'.tr,
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            showLabel: true,
            labelText: "Message",
            hintText: "Enter your message",
            controller: messageController,
            keyboardType: TextInputType.text,
            validateEmptyText: 'description_required'.tr,
            maxLines: 4,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: size.width,
            height: 48,
            child: AppElevatedButton(
              text: "Apply",
              onPressed: (){},),
          ),
        ],
      ),
    );
  }
}
