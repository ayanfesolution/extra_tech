import 'package:extra_tech/util/components/padded.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AllReviewsScreen extends StatefulHookConsumerWidget {
  const AllReviewsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllReviewsScreenState();
}

class _AllReviewsScreenState extends ConsumerState<AllReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padded(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
