import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  final String name;
  final bool iselect;
  final VoidCallback onTab;

  ListCategory({
    super.key,
    required this.iselect,
    required this.onTab,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTab,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: 200,
        height: 100,
        color: iselect ? Colors.white : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: iselect ? theme.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              width: 10,
            ),
            Expanded(
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: theme.canvasColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
