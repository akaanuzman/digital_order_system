import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/models/service/restaurant_model.dart';
import 'package:digital_order_system/products/utility/exception/firebase_custom_exception.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget with BaseSingleton {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference restaurants =
        FirebaseFirestore.instance.collection('Restaurants');

    final response = restaurants.withConverter(
      fromFirestore: (snapshot, options) {
        return RestaurantModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomException('$value not null.');
        return value.toJson();
      },
    ).get();
    return Scaffold(
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<RestaurantModel?>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text("404");
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                final restaurants =
                    snapshot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (BuildContext context, int index) {
                    RestaurantModel restraurant =
                        restaurants[index] ?? RestaurantModel();
                    return ListTile(
                      textColor: colors.textColor,
                      leading: Image.network(restraurant.imageUrl ?? ''),
                      title: Text("${restraurant.companyName}"),
                      subtitle: Column(
                        crossAxisAlignment: context.crossAxisAStart,
                        children: [
                          Text("${restraurant.companyMail}"),
                          Text(
                            restraurant.createdDate?.toDate().toString() ?? "",
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("400: Bad request"),
                );
              }
          }
        },
      ),
    );
    
  }
}
