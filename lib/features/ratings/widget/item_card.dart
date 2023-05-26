import 'package:flutter/material.dart';
import 'package:rating/constants/constants.dart';
import 'package:rating/features/ratings/screens/item_screen.dart';
import 'package:rating/features/ratings/services/item.dart';
import 'package:rating/features/ratings/services/item_screen_arguments.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    void showItemRatings() {
      Navigator.pushNamed(context, ItemScreen.routeName, arguments: ItemScreenArguments(item: item));
    }

    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () => showItemRatings(),
        child: Padding(
          padding: const EdgeInsets.all(Constants.normalPadding),
          child: SizedBox(
            width: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 100, height: 100, child: item.image),
                const SizedBox(height: Constants.smallPadding),
                Flexible(child: Text(item.name)),
                const SizedBox(height: Constants.minimalPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(item.averageRating.toStringAsFixed(1)),
                    const SizedBox(width: Constants.smallPadding),
                    const Text("🔥"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}