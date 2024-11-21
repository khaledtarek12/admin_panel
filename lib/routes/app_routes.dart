import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store_web_adimn/features/authentication/screens/forget_password/forget_password.dart';
import 'package:t_store_web_adimn/features/authentication/screens/login/login.dart';
import 'package:t_store_web_adimn/features/authentication/screens/reset_password/reset_password.dart';
import 'package:t_store_web_adimn/features/personalization/screens/dashboard/dashboard.dart';
import 'package:t_store_web_adimn/routes/route_middleware.dart';
import 'package:t_store_web_adimn/routes/routes.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: TRoutes.login,
      page: () => const LoginScreen(),
      // middlewares: [TRouteMiddleware()]
    ),

    GetPage(
      name: TRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),

    GetPage(
      name: TRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
    ),

    GetPage(
      name: TRoutes.dashboard,
      page: () => const DashboardScreen(),
      middlewares: [TRouteMiddleware()],
    ),
    // GetPage(
    //     name: TRoutes.dashboard,
    //     page: () => DashboardScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.media,
    //     page: () => MediaScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.banners,
    //     page: () => BannerScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createBanner,
    //     page: () => CreateBannerScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.editBanner,
    //     page: () => EditBannerScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.categories,
    //     page: () => CategoriesScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createCategory,
    //     page: () => CreateCategoryScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.editCategory,
    //     page: () => EditCategoryScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.brands,
    //     page: () => BrandsScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createBrand,
    //     page: () => CreateBrandScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.editBrand,
    //     page: () => EditBrandScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.customers,
    //     page: () => CustomersScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createCustomer,
    //     page: () => CreateCustomerScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.customerDetails,
    //     page: () => CustomerDetailsScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.orders,
    //     page: () => OrdersScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createOrder,
    //     page: () => CreateOrderScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.editOrder,
    //     page: () => EditOrderScreen(),
    //     middlewares: [TRouteMiddleware()]),
  ];
}
