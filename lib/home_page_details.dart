import 'package:dynamic_link_app/deep_linking/create_dynamic_link.dart';
import 'package:flutter/material.dart';

class HomePageDetails extends StatefulWidget {
  final String id;

  const HomePageDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<HomePageDetails> createState() => _HomePageDetailsState();
}

class _HomePageDetailsState extends State<HomePageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Home Page Details",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                FireBaseDeepLink.createDynamicLink(
                  id: widget.id,
                  title: "start",
                );
              },
              child: const Icon(Icons.share),
            ),
          )
        ],
      ),
    );
  }
}
