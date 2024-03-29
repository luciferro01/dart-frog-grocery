import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/blocs/home/home_bloc.dart';
import 'package:grocery_app/widgets/bottom_naviagtion_bar.dart';
import 'package:grocery_app/widgets/grocery_search_text_form_field.dart';
import 'package:models/models.dart';

import '../widgets/grocery_product_list.dart';
import '../widgets/grocery_product_of_the_day.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Category.sampleData;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primaryContainer,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
          ),
        ),
        title: Column(
          children: [
            Text(
              'Pickup',
              style: textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Location 1',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Badge(
              isLabelVisible: true,
              label: Text('2'),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: const GrocerySearchTextFormField(),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(index: 0),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading ||
              state.status == HomeStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == HomeStatus.loaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  children: [
                    _buildSectionTitle(
                      textTheme,
                      'Popular Categories',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 130.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return InkWell(
                            onTap: () {
                              context.goNamed(
                                'category',
                                pathParameters: {'categoryId': category.id},
                              );
                            },
                            child: Container(
                              width: 80.h,
                              margin: const EdgeInsets.only(right: 8.0),
                              child: Column(
                                children: [
                                  Image.network(
                                    category.imageUrl!,
                                    height: 80.h,
                                    width: 80.h,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(category.name, maxLines: 2),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8.h),
                    GroceryProductOfTheDay(
                      product: state.productOfTheDay ?? Product.empty,
                    ),
                    SizedBox(height: 8.h),
                    _buildSectionTitle(
                      textTheme,
                      'Popular Products',
                      onPressed: () {},
                    ),
                    SizedBox(height: 8.h),
                    GroceryProductList(products: state.popularProducts),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }

  Row _buildSectionTitle(
    TextTheme textTheme,
    String title, {
    VoidCallback? onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}
