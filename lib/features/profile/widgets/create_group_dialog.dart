import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rating/constants/constants.dart';
import 'package:rating/features/core/services/cloud_service.dart';

class CreateGroupDialog extends StatelessWidget {
  const CreateGroupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    void cancel() {
      Navigator.of(context).pop();
    }

    void create() {
      CloudService.createGroup(nameController.text);
      Navigator.of(context).pop();
    }

    return PlatformAlertDialog(
      title: const Text("Gruppe erstellen"),
      content: PlatformTextField(
        controller: nameController,
        material: (context, platform) {
          return MaterialTextFieldData(
            decoration: const InputDecoration(
              labelText: "Name der Gruppe",
              border: OutlineInputBorder(),
            ),
          );
        },
        cupertino: (context, platform) {
          return CupertinoTextFieldData(placeholder: "Name der Gruppe");
        },
      ),
      material: (context, platform) {
        return MaterialAlertDialogData(
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: Constants.normalPadding,
            vertical: Constants.smallPadding,
          ),
        );
      },
      actions: [
        PlatformDialogAction(
          child: const Text("Abbrechen"),
          onPressed: () => cancel(),
        ),
        PlatformDialogAction(
          child: const Text("Erstellen"),
          onPressed: () => create(),
        ),
      ],
    );
  }
}
