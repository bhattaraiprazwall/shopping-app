import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // it ignores the top notch and avoids the bottom bar also
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  //take how much space in available only
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      //detects which chip is tapped or pressure
                      onTap: () {
                        setState(() {
                          selectedFilter =
                              filter; //rebuilds the entire build function and shows  which chip is selected
                        });
                      },
                      child: Chip(
                        //the chip UI
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromRGBO(245, 247, 249, 1),
                        //Theme.of(context).colorScheme.primary searches and inherits the nearest Theme widget of its parent or ancestor(Concept of inherited widget)
                        side: BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),

                        label: Text(filter),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? Color.fromRGBO(216, 240, 253, 1)
                        : Color.fromRGBO(245, 247, 249, 1),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
