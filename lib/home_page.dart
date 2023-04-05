import 'package:dynamic_link_app/deep_linking/create_dynamic_link.dart';
import 'package:dynamic_link_app/home_page_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FireBaseDeepLink.initDynamicLinks(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Firebase Dynamic Links"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 5.0,
              minWidth: 200.0,
              height: 35,
              color: const Color(0xFF801E48),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const HomePageDetails(
                      id: '',
                    );
                  },
                ));
              },
              child: const Text(' Dynamic Links btn',
                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
            ),
          ),
        ));
  }
}
