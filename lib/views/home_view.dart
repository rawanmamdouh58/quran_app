import 'dart:ui';

import 'package:app/widgets/topic.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key});

  final List<String> pageRoutes = [
    'hesn_almoslem',
  ];

  @override
  Widget build(BuildContext context) {
    // List of topics
    List<String> topics = [
      'حصن المسلم',

      // Add more topics as needed
    ];

    return Scaffold(
      // backgroundColor: Color(0xff267000),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.66,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 360,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.amber,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        const Text(
                          'القرآن الكريم',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'القرآن الكريم كاملًا',
                          style: TextStyle(fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 150.0,
                          ),
                          child: Image.asset(
                            'assets/images/quranRail.png',
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: topics.length, // Total number of items
                    itemBuilder: (context, index) {
                      return Topic(
                        content: [topics[index]],
                        navigateTo:
                            pageRoutes[index], // Pass the route to navigate to
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
