import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:lectura_api_package/fake_store_package.dart';
import 'add_product_screen.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ApiService _apiService = ApiService();
  late Future<dartz.Either<String, List<Product>>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    setState(() {
      _productsFuture = _apiService.fetchProducts();
    });
  }

  Future<void> _addProduct(Product newProduct) async {
    final result = await _apiService.addProduct(newProduct);
    result.fold(
      (error) => _showMessage('Error al agregar producto: $error'),
      (product) {
        _showMessage('Producto agregado: ${product.title}');
        _loadProducts();
      },
    );
  }

  Future<void> _deleteProduct(int productId) async {
    final result = await _apiService.deleteProduct(productId);
    result.fold(
      (error) => _showMessage('Error al eliminar producto: $error'),
      (product) {
        _showMessage('Producto eliminado: ${product.title}');
        _loadProducts();
      },
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Productos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    AddProductScreen(onProductAdded: _addProduct),
              ));
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products =
                (snapshot.data as dartz.Either<String, List<Product>>).fold(
              (l) => [],
              (r) => r,
            );

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onDelete: () => _deleteProduct(product.id),
                );
              },
            );
          }
        },
      ),
    );
  }
}
