import 'package:flutter/material.dart';

const basUrl = 'http://accbcs.xyz/api/v1/';
const String imagesBaseUrl = 'https://direction.hwzn.sa/public/';
const String userAvatar = 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg';

const String loginPath = "login";
const String registerPath = "register";
const String logoutPath = "logout";
const String partnersPath = "partners";

const String homeDataPath = "home";
const String slidersPath = "sliders";
const String categoriesPath = "categories";
const String categoryByIdPath = "categories/";
const String servicesPath = "services";
const String servicesByIdPath = "services/";
const String eventsPath = "events";
const String eventByIdPath = "events/";
const String blogsPath = "blogs";
const String blogByIdPath = "blogs/";
const String articleCategoriesPath = "articleCategories";
const String articleCategoryByIdPath = "articleCategories/";
const String coursesCategoriesPath = "articleCategories";
const String coursesCategoryByIdPath = "articleCategories/";
const String coursesPath = "courses";
const String productsPath = "products";
const String productCategoriesPath = "productCategories";
const String productByIdPath = "products/";
const String portfoliosPath = "portfolios";
const String allJobsPath = "jobs";
const String jobDetailsPath = "jobs/";
const String jobApplyPath = "jobs/apply";
const String sectionStatusPath = "setting/all/section_status";
const String settingsPath = "settings";
const String sectionByTypePath = "/sections/";
const String faqsPath = "faqs";
const String termsPath = "terms";
const String aboutPath = "about";
const String policyPath = "policy";
const String contactUsPath = "contact";
const String pagesPath = "pages";
const String pageDetailsPath = "pages/";

/// footer
const String usefulLinksPath = "footer/useful-links";
const String linkDetailsPath = "footer/useful-link/";
const String footerDataPath = "footer/";
/// themes
const String theamsPath = "theams";
const String theamDetailsPath = "theam/";

/// App IMAGES
const String appLogo = "assets/images/logo.png";

const kDefaultPadding = 16.0;
const kDefaultPadding_2 = 20.0;
const kDefaultBorderRadius = 16.0;

String reformatDate(DateTime? value) {
  if (value == null) return '';
  final reformatted = value.year.toString() +
      '-' +
      value.month.toString().padLeft(2, '0') +
      '-' +
      value.day.toString().padLeft(2, '0');
  return reformatted;
}

