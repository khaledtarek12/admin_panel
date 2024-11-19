import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store_web_adimn/app.dart';
import 'package:t_store_web_adimn/routes/route_middleware.dart';
import 'package:t_store_web_adimn/routes/routes.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    GetPage(
        name: TRoutes.firstScreen,
        page: () => const FirstScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.secondScreen,
        page: () => const SecondScreen(),
        middlewares: [TRouteMiddleware()]),
    GetPage(
        name: TRoutes.secondScreenWithUID, page: () => const SecondScreen()),
    GetPage(
        name: TRoutes.resposiveDesignScreen, page: () => const ResposiveDesignScreen()),
    // GetPage(name: TRoutes.login, page: () => LoginScreen()),
    // GetPage(name: TRoutes.forgetPassword, page: () => ForgetPasswordScreen()),
    // GetPage(name: TRoutes.resetPassword, page: () => RestPasswordScreen()),
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
