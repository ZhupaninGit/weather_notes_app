import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.black.withValues(alpha: 0.4),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: theme.platform == TargetPlatform.android
                  ? const CircularProgressIndicator()
                  : CupertinoActivityIndicator(
                      color: theme.colorScheme.primary,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
