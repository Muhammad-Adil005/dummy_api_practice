import 'package:dummy_api_practice_app/fruits/fruits.dart';
import 'package:dummy_api_practice_app/services/model/api/fruits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../flutter_shimmer.dart';

class FruitScreen extends StatelessWidget {
  const FruitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        //foregroundColor: Colors.transparent,
        // surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Fruit Screen'),
      ),
      body: BlocProvider(
        create: (context) => FruitBloc(fruitRepo: FruitsRepository()),
        child: BlocBuilder<FruitBloc, FruitState>(
          builder: (context, state) {
            // if (state.loading) {
            //   return const Center(child: CircularProgressIndicator());
            // }
            if (state.loading) {
              return const FruitShimmer();
            } else if (state.fruitPost != null) {
              return ListView.builder(
                itemCount: state.fruitPost!.length,
                itemBuilder: (context, index) {
                  final fruit = state.fruitPost![index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.teal.shade200, width: 1),
                    ),
                    elevation: 2,
                    surfaceTintColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fruit.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(fruit.family),
                              Text(fruit.order),
                              Text(fruit.genus),
                              const SizedBox(height: 16),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Text('Nutrition Information:',
                              //     style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                'Calories: ${fruit.nutritions.calories}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('proteins: ${fruit.nutritions.protein}'),
                              Text(
                                  'Carbohydrates: ${fruit.nutritions.carbohydrates}'),
                              Text('Sugar: ${fruit.nutritions.sugar}'),
                              Text('Fat: ${fruit.nutritions.fat}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                  /* ListTile(
                    leading: Text(user.name),
                    title: Text(
                      user.family,
                    ),
                    subtitle: Text(user.order),
                  );*/
                },
              );
            } else if (state.errorMessage != null) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return const Center(child: Text('No users found'));
            }
          },
        ),
      ),
    );
  }
}
