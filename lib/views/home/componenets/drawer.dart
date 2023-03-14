import 'package:cms_app/data/models/page_model.dart';
import 'package:cms_app/services/menu_service.dart';
import 'package:cms_app/views/donations/donations_screen.dart';
import 'package:cms_app/views/events/events_screen.dart';
import 'package:cms_app/views/faqs/faqs_screen.dart';
import 'package:cms_app/views/sections/about/about_section_screen.dart';
import 'package:cms_app/views/sections/experience/experience_section.dart';
import 'package:cms_app/views/sections/solutions/solutions_section_screen.dart';
import 'package:cms_app/views/testimonials/testimoials_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/api_response/allSections_status_response.dart';
import '../../../helper/icon_broken.dart';
import '../../../services/settings_services.dart';
import '../../../widgets/appCachedImage.dart';
import '../../blogs/blogs_view.dart';
import '../../courses/courses_screen.dart';
import '../../products/products_screen.dart';
import '../../sections/experience/experience_section_screen.dart';
import '../../setting_info/page_view_screen.dart';
import 'slide_menu_item.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int selectedMenuItem = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<PageModel> pages = Get.find<MenuService>().allPages ?? [];
    SectionsData? sectionsStatusData =
        Get.find<MenuService>().sectionsStatusData;
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.horizontal(right: Radius.circular(28.0))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 8.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: AppCachedImage(
                    imageUrl: Get.find<SettingsService>()
                            .appIconSettings
                            ?.plainValue ??
                        "",
                    width: size.width * 0.5,
                    height: 110,
                    fit: BoxFit.contain,
                  )),
                  InkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset("assets/icons/close.svg")),
                ],
              ),
              SlideMenuItem(
                  index: 0,
                  title: "home".tr,
                  icon: IconBroken.home,
                  isActive: false,
                  press: () {
                    // controller.changeDrawerIndex(0);
                    Get.back();
                  }),
              SlideMenuItem(
                index: 1,
                icon: Icons.article_outlined,
                title: "blogs".tr,
                isActive: false,
                press: () {
                  Get.to(() => const BlogsView());
                },
              ),
              SlideMenuItem(
                index: 2,
                icon: Icons.calendar_month_outlined,
                title: "events".tr,
                isActive: false,
                press: () {
                  Get.to(() => const EventsScreen());
                },
              ),
              SlideMenuItem(
                index: 3,
                icon: IconBroken.buy,
                title: "products",
                isActive: false,
                press: () {
                  Get.to(() => const ProductsScreen());
                },
              ),
              SlideMenuItem(
                index: 4,
                icon: IconBroken.editSquare,
                title: "courses".tr,
                isActive: false,
                press: () {
                  Get.to(() => const CoursesScreen());
                },
              ),
              SlideMenuItem(
                index: 5,
                icon: IconBroken.wallet,
                title: "donations".tr,
                isActive: false,
                press: () {
                  Get.to(() => const DonationsScreen());
                },
              ),
              SlideMenuItem(
                index: 6,
                icon: IconBroken.ticket,
                title: "testimonials".tr,
                isActive: false,
                press: () {
                  Get.to(() => const AllTestimonialsScreen());
                },
              ),
              SlideMenuItem(
                index: 7,
                icon: IconBroken.infoCircle,
                title: "faqs".tr,
                isActive: false,
                press: () {
                  Get.to(() => const FaqsScreen());
                },
              ),
              ...pages.map((page) {
                int index = pages.indexOf(page);
                return SlideMenuItem(
                  index: index,
                  title: page.name ?? "",
                  icon: IconBroken.infoCircle,
                  isActive: selectedMenuItem == index ? true : false,
                  press: () {
                    Get.to(() => OnePageViewScreen(pageModel: page));
                  },
                );
              }),

              /// sections
              if (sectionsStatusData?.about ?? false)
                SlideMenuItem(
                  index: 6,
                  icon: IconBroken.show,
                  title: "About Section".tr,
                  isActive: false,
                  press: () {
                    Get.to(() => const AboutSectionScreen());
                  },
                ),
              if (sectionsStatusData?.experience ?? false)
                SlideMenuItem(
                  index: 6,
                  icon: Icons.history_edu,
                  title: "Experience Section".tr,
                  isActive: false,
                  press: () {
                    Get.to(() => const ExperienceSectionScreen());
                  },
                ),
              if (sectionsStatusData?.solutions ?? false)
                SlideMenuItem(
                  index: 6,
                  icon: Icons.history_edu,
                  title: "Solutions".tr,
                  isActive: false,
                  press: () {
                    Get.to(() => const SolutionsSectionScreen());
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
