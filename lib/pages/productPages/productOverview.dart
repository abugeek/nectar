import 'package:flutter/material.dart';

class ProductOverview extends StatefulWidget {
  const ProductOverview({super.key});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share),
          ),
        ],
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
