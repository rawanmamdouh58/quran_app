import 'package:app/models/counter_provider.dart';
import 'package:app/models/data_service.dart';
import 'package:app/widgets/doaa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AzkarBody extends StatelessWidget {
  const AzkarBody({super.key});

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
              List<AzkarItem> azkarItems = snapshot.data?[0].array ?? [];
              return ListView.builder(
                itemCount: azkarItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChangeNotifierProvider(
                        create: (context) => CounterProvider(),
                        child: Consumer(
                          builder: (context, value, _) {
                            return Doaa(
                              text: azkarItems[index].text,
                              onTap: () {
                                context.read<CounterProvider>().decrement();
                              },
                              counter: azkarItems[index].count +
                                  context.watch<CounterProvider>().counter,
                              // context
                              //     .watch<CounterProvider>()
                              //     .counter
                              //     .toString(),
                            );
                          },
                        )),
                  );
                },
              );
            }
          }
        });
  }
}
