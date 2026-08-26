import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(
    //   context,
    // ).size; //inherited model will allow us to select one feature or one property to listen to ,inherited widget listens to everything ,the entire class
    return SafeArea(
      // it ignores the top notch and avoids the bottom bar also
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
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
                    //detects which chip is tapped or pressed
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
                      side: BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),

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
            child: LayoutBuilder( //it takes width and height based on the restrictions imposed by its parent widgets on it
              builder: (context, constraints) {
                //layout builder gets its constraints from it's parent widget
                if (constraints.maxWidth > 1080) {
                  return GridView.builder(
                    // if the size or screen of device is > 650 the grid view builder is shown otherwise the list view builder
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                    ),
                              
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              //push allows to go back but push replacement doesn't(push replacement is used in login and logged in statuses)
                              builder: (context) {
                                return ProductDetailPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              //push allows to go back but push replacement doesn't(push replacement is used in login and logged in statuses)
                              builder: (context) {
                                return ProductDetailPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),

          // Expanded(
          //   child: size.width>650 ? GridView.builder( // if the size or screen of device is > 650 the grid view builder is shown otherwise the list view builder
          //     itemCount: products.length,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2 ),

          //     itemBuilder:(context, index) {
          //       final product=products[index];
          //       return GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 //push allows to go back but push replacement doesn't(push replacement is used in login and logged in statuses)
          //                 builder: (context) {
          //                   return ProductDetailPage(product: product);
          //                 },
          //               ),
          //             );
          //           },
          //           child: ProductCard(
          //             title: product['title'] as String,
          //             price: product['price'] as double,
          //             image: product['imageUrl'] as String,
          //             backgroundColor: index.isEven
          //                 ? Color.fromRGBO(216, 240, 253, 1)
          //                 : Color.fromRGBO(245, 247, 249, 1),
          //           ),
          //         );
          //     },):
          //     ListView.builder(
          //     itemCount: products.length,
          //     itemBuilder: (context, index) {
          //       final product = products[index];
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.of(context).push(
          //             MaterialPageRoute(
          //               //push allows to go back but push replacement doesn't(push replacement is used in login and logged in statuses)
          //               builder: (context) {
          //                 return ProductDetailPage(product: product);
          //               },
          //             ),
          //           );
          //         },
          //         child: ProductCard(
          //           title: product['title'] as String,
          //           price: product['price'] as double,
          //           image: product['imageUrl'] as String,
          //           backgroundColor: index.isEven
          //               ? Color.fromRGBO(216, 240, 253, 1)
          //               : Color.fromRGBO(245, 247, 249, 1),
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
