import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating/constants/constants.dart';
import 'package:rating/features/core/utils/string_parser.dart';
import 'package:rating/features/ratings/models/item.dart';
import 'package:rating/features/settings/provider/settings_provider.dart';

class MapItem extends StatelessWidget {
  final Item item;
  final bool highlighted;
  final Function()? onTap;
  const MapItem({super.key, required this.item, this.highlighted = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    const int maxNameLength = 16;
    SettingsProvider settings = Provider.of<SettingsProvider>(context);

    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.all(Constants.smallPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(Constants.defaultBorderRadius),
              border: Border.all(
                color: highlighted ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.background,
                width: Constants.minimalPadding,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: item.image ??
                  Center(
                    child: Text(StringParser.truncate(item.name, maxNameLength)),
                  ),
            ),
          ),
          Positioned(
            top: -Constants.minimalPadding,
            right: -Constants.minimalPadding,
            child: Container(
              padding: const EdgeInsets.all(Constants.minimalPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                item.averageRating.toStringAsFixed(settings.numberOfDecimals),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
