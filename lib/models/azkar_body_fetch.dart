import 'package:app/models/counter_provider.dart';
import 'package:app/models/data_service.dart';
import 'package:app/widgets/doaa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';

class AzkarBody extends StatelessWidget {
  AzkarBody({super.key, required this.number});
  int number;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Azkar>>(
        future: DataService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            } else {
              List<AzkarItem> azkarItems = snapshot.data?[number].array ?? [];
              return ListView.builder(
                itemCount: azkarItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChangeNotifierProvider(
                      create: (context) => CounterProvider(),
                      child: Consumer(
                        builder: (context, value, _) {
                          int totalCounter = azkarItems[index].count +
                              context.watch<CounterProvider>().counter;
                          return AnimatedSizeAndFade(
                            sizeDuration: const Duration(milliseconds: 500),
                            fadeDuration: const Duration(milliseconds: 500),
                            child: totalCounter <= 0
                                ? null
                                : Doaa(
                                    text: azkarItems[index].text,
                                    onTap: () {
                                      context
                                          .read<CounterProvider>()
                                          .decrement();
                                    },
                                    counter: totalCounter,
                                  ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
          }
        });
  }
}
