

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled3/core/route/route.dart';
import '../../core/usable widget/CategoryCard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  // 🔹 Full category list
  List<String> allCategories = [
    "Trigonometry",
    "Vocabulary",
    "Grammar",
    "Geography",
    "XXX",
  ];

  // 🔹 This list will update with search
  List<String> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    filteredCategories = allCategories; // initially full list
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),

      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leadingWidth: 120,

        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),

            InkWell(
              onTap: (){
                Get.offAllNamed(AppRoutes.homeScreen);
              },
              child: Image.asset(
                "assets/images/Frame.png",
                height: 20,
                width: 20,
              ),
            ),

            const SizedBox(width: 6),

            Text(
              "Back",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),

          Padding(
            padding: const EdgeInsets.only(),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      width: size.width * 0.86,
                      constraints: const BoxConstraints(maxWidth: 420),
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xffF1F5F9)),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          // 🔹 SEARCH FIELD
                          Container(
                            height: 54,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  filteredCategories = allCategories
                                      .where((item) =>
                                      item.toLowerCase().contains(value.toLowerCase()))
                                      .toList();
                                });
                              },

                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: const TextStyle(color: Color(0xffA8ACB1)),
                                filled: true,
                                fillColor: Color(0xffFFFFFF),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Color(0xffF1F4F8)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Color(0xffF1F4F8)),
                                ),

                                suffixIcon: Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xff023F86),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(Icons.search, color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 12),

                          // 🔹 Filtered Category List
                          Column(
                            children: filteredCategories
                                .map((item) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: CategoryCard(title: item),
                            ))
                                .toList(),
                          ),

                        ],
                      ),
                    ),
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
