import 'package:cms_app/services/menu_service.dart';
import 'package:cms_app/views/events/events_screen.dart';
import 'package:cms_app/views/faqs/faqs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../helper/appTheme.dart';
import '../../../helper/icon_broken.dart';
import '../../../services/settings_services.dart';
import '../../../widgets/appCachedImage.dart';
import '../../blogs/blogs_view.dart';
import '../../courses/courses_screen.dart';
import '../../products/products_screen.dart';
import '../../setting_info/page_view_screen.dart';
import 'drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(28.0))
        ),
        child: SingleChildScrollView(
          child: Column(
              children: [
                const SizedBox(height: 8.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: AppCachedImage(
                        imageUrl: Get.find<SettingsService>().appIconSettings?.plainValue??"",
                        width: size.width*0.5, height: 96, fit: BoxFit.contain,)),
                    InkWell(
                        onTap: ()=> Get.back(),
                        child: SvgPicture.asset("assets/icons/close.svg")),
                  ],
                ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 16.0),
                //   child: Divider(color: Colors.grey),
                // ),
                DrawerItem(
                    index: 0,
                    title: "Home",
                    icon: IconBroken.home,
                    onPressed: () {
                      // controller.changeDrawerIndex(0);
                      Get.back();
                    }),
                DrawerItem(
                  index: 1,
                  icon: Icons.article_outlined,
                  title: "Blogs",
                  onPressed: () {
                    Get.to(()=> const BlogsView());
                  },
                ),
                DrawerItem(
                  index: 2,
                  icon: Icons.calendar_month_outlined,
                  title: "Events",
                  onPressed: () {
                    Get.to(()=> const EventsScreen());
                  },
                ),
                DrawerItem(
                  index: 3,
                  icon: IconBroken.bag,
                  title: "Products",
                  onPressed: () {
                    Get.to(()=> const ProductsScreen());
                  },
                ),
                // Divider(color: AppTheme.primaryColor.withOpacity(0.5)),
                DrawerItem(
                  index: 4,
                  icon: IconBroken.editSquare,
                  title: "Courses",
                  onPressed: () {
                    Get.to(()=> const CoursesScreen());
                  },
                ),
                // Divider(color: AppTheme.primaryColor.withOpacity(0.5)),
                DrawerItem(
                  index: 5,
                  icon: IconBroken.infoCircle,
                  title: "FAQS",
                  onPressed: () {
                    Get.to(()=> const FaqsScreen());
                  },
                ),
                ...Get.find<MenuService>().allPages!.map((page) {
                  int index = Get.find<MenuService>().allPages!.indexOf(page);
                return DrawerItem(
                  index: index+4,
                  title: page.name??"",
                  icon: IconBroken.infoCircle,
                  onPressed: () {
                    Get.to(()=> OnePageViewScreen(pageModel: page));
                  },
                );}),
              ],
            ),
        ),
      ),
    );
  }
}
