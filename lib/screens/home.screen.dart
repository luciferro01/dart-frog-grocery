import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/widgets/bottom_naviagtion_bar.dart';
import 'package:grocery_app/widgets/grocery_search_text_form_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
