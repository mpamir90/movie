import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class Sheet extends StatelessWidget {
  const Sheet({
    Key? key,
    this.title,
    required this.child,
    required this.isExpanded,
  }) : super(key: key);

  final String? title;
  final Widget child;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    final sheetWidget = Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _SheetHandleBar(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(bottom: 0),
                    child: Text(title!, style: textTheme.titleLarge),
                  ),
              ],
            ),
          ),
          if (isExpanded) Expanded(child: child) else child,
        ],
      ),
    );

    return sheetWidget;
  }
}

class _SheetHandleBar extends StatelessWidget {
  const _SheetHandleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return Align(
      child: Container(
        width: 64,
        height: 8,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: palette.gray[50],
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
