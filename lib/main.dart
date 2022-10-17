import 'package:flutter/material.dart';
// import 'ui/products/products_manager.dart';
// import 'ui/products/product_detail_screen.dart';
// import 'ui/products/product_overview_screen.dart';
// import 'ui/products/user_products_screen.dart';
// import 'ui/cart/cart_screen.dart';
// import 'ui/orders/orders_screen.dart';
import 'package:provider/provider.dart';
import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName: (ctx) => const OrdersScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductScreen.routeName: (ctx) => const UserProductScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ProductDetailScreen.routeName) {
            final productId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (ctx) {
                return ProductDetailScreen(
                  ctx.read<ProductsManager>().findById(productId),
                );
              },
            );
          }
          return null;
        },
      ),
    );
    //   return MaterialApp(
    //       title: 'My Shop',
    //       theme: ThemeData(
    //         fontFamily: 'Lato',
    //         colorScheme: ColorScheme.fromSwatch(
    //           primarySwatch: Colors.purple,
    //         ).copyWith(
    //           secondary: Colors.deepOrange,
    //         ),
    //       ),
    //       // home: Container(
    //       //   color: Colors.green,
    //       // ),

    //       //

    //       // home: SafeArea(
    //       //   child: ProductDetailScreen(
    //       //     ProductsManager().items[0],
    //       //   ),
    //       // ),

    //       // home: const SafeArea(
    //       //   child: OrdersScreen(),
    //       // ),

    //       home: const ProductsOverviewScreen(),
    //       routes: {
    //         CartScreen.routeName: (ctx) => const OrdersScreen(),
    //         OrdersScreen.routeName: (ctx) => const OrdersScreen(),
    //         UserProductScreen.routeName: (ctx) => const UserProductScreen(),
    //       },
    //       onGenerateRoute: (settings) {
    //         if (settings.name == ProductDetailScreen.routeName) {
    //           final productId = settings.arguments as String;
    //           return MaterialPageRoute(
    //             builder: (ctx) {
    //               return ProductDetailScreen(
    //                 ProductsManager().findById(productId),
    //               );
    //             },
    //           );
    //         }
    //         return null;
    //       });
  }
}
