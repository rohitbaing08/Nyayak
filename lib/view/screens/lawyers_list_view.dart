import 'package:flutter/material.dart';
import 'package:nyayak/view/components/search_card.dart';
import 'package:nyayak/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class LawyerListView extends StatelessWidget {
  final String type;
  const LawyerListView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          type,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, child) => FutureBuilder(
          future: value.fetchLawyers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              value.mainList = snapshot.data;
              value.filterByType(type);
              return value.displayList.isEmpty
                  ? const Center(
                      child: Text('Nothing to show'),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: value.displayList.length,
                          itemBuilder: (context, index) {
                            return SearchCard(
                              lawyer: value.displayList[index],
                            );
                          },
                        ),
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}
