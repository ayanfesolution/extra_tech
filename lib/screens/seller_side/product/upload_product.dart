import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UploadProductScreen extends StatefulHookConsumerWidget {
  const UploadProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadProductScreenState();
}

class _UploadProductScreenState extends ConsumerState<UploadProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
