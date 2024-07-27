import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Wrapper on [AsyncValue], it automatically manages error and loader cases.
/// It also has a named constructor where you can set a custom loader
class AsyncValueWidget<T> extends ConsumerWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loader,
    this.error,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loader;
  final Widget? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.when(
      data: data,
      loading: () =>
          loader ?? const Center(child: CircularProgressIndicator.adaptive()),
      error: (e, st) =>
          error ??
          Center(
            child: Text(e.toString()),
          ),
    );
  }
}
