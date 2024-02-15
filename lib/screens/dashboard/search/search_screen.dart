import 'package:extra_tech/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Near You',
          style: kCustomTextStyle(
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
