import 'package:flutter/material.dart';
import 'package:wordy/utilities/word_and_phonetics.dart';

class DeleteModal extends StatelessWidget {
  const DeleteModal({
    super.key,
    required this.objectName,
    required this.fromWhere,
    required this.deleteAction,
  });
  final String objectName;
  final String fromWhere;
  final Function() deleteAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      title: RichText(
        text: TextSpan(
          style: context.textTheme.bodyLarge,
          text: "Do you want to delete ",
          children: [
            TextSpan(
              text: objectName,
              style: TextStyle(
                color: context.colorscheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: " from $fromWhere?",
            )
          ],
        ),
      ),
      icon: const Icon(Icons.delete),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return context.colorscheme.primary.withOpacity(0.2);
                  }
                  return Colors.transparent;
                },
              ),
            ),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              deleteAction();
              Navigator.of(context).pop();
            },
            highlightColor: context.colorscheme.error.withOpacity(
              0.3,
            ),
            child: Text(
              "Delete",
              style: TextStyle(color: context.colorscheme.error),
            ),
          ),
        ],
      ),
    );
  }
}
