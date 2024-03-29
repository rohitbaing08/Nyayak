import 'package:flutter/material.dart';
import 'package:nyayak/res/colors.dart';
import 'package:nyayak/view/components/search_card.dart';
import 'package:nyayak/view/components/search_filter.dart';
import 'package:nyayak/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String? locationFilter;
  String? typeFilter;
  List displayList = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) => Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              TextFormField(
                onChanged: (val) {
                  print(val);
                  value.editList(val);
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: LightAppColors().seedColor,
                  ),
                  hintText: 'Search name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: LightAppColors().seedColor, width: 0.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: LightAppColors().seedColor, width: 0.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SearchFilter(
                    title: 'Location',
                    selected: locationFilter,
                    ontap: (val) {
                      value.filterByLocation(val);
                    },
                    items: const [
                      'Maharashtra',
                      'Delhi',
                      'Goa',
                      'Karnataka',
                      'Gujrat'
                    ],
                  ),
                  SearchFilter(
                    title: 'Type',
                    selected: typeFilter,
                    ontap: (val) {
                      value.filterByType(val);
                    },
                    items: const [
                      'Advocate',
                      'Notary',
                      'Mediator',
                      'Document writer',
                      'Arbitrator'
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .70,
                width: double.infinity,
                child: FutureBuilder(
                  future: value.fetchLawyers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      value.mainList = snapshot.data;
                      return value.displayList.isEmpty
                          ? const Center(
                              child: Text('Nothing to show'),
                            )
                          : ListView.builder(
                              itemCount: value.displayList.length,
                              itemBuilder: (context, index) {
                                return SearchCard(
                                  lawyer: value.displayList[index],
                                );
                              },
                            );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
