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
  String searchedName = '';
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SearchFilter(title: 'Location'),
                  SearchFilter(title: 'Type'),
                  SearchFilter(title: 'Experience'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: FutureBuilder(
                  future: value.fetchLawyers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: value.displayList.length,
                        itemBuilder: (context, index) {
                          return SearchCard(
                              name: value.displayList[index].name);
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
