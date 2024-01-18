
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.func});
  final void Function(String) func;
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            //margin: EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primary.withOpacity(0.7)
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.restaurant,
                  size: 30,
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Let\'s cook!',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Meals',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            leading: const Icon(Icons.fastfood),
            onTap: ()=>func('meals'),
          ),
          ListTile(
            title: Text(
              'Filters',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            leading: const Icon(Icons.settings),
            onTap: ()=>func('filter'),
          )
        ],
      ),
    );
  }
}
