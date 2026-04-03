import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

/// 🔹 ROUTER CONFIGURATION
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

    /// 🔸 Path parameter: /product/:id
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final name = state.uri.queryParameters['name'] ?? 'No name';

        return ProductDetailScreen(id: id, name: name);
      },
    ),
  ],
);

/// 🔹 MAIN APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router Demo 02',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

/// 🔹 HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          /// 🔸 Navigate with BOTH path + query parameters
          onPressed: () {
            context.go('/product/101?name=Laptop');
          },
          child: const Text('Go to Product'),
        ),
      ),
    );
  }
}

/// 🔹 PRODUCT DETAIL SCREEN
class ProductDetailScreen extends StatelessWidget {
  final String id;
  final String name;

  const ProductDetailScreen({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Product ID: $id', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Product Name: $name', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
