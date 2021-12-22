import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ortez_app/models/category_model.dart';
import 'package:ortez_app/providers/api_provider.dart';
import 'package:ortez_app/screens/item_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // List<CategoryData>? categoryData;
  List? categoryData;

  Future getCategories() async {
    var categories = await ApiProvider().getCategories();
    if (mounted) {
      setState(() {
        categoryData = categories;
        // categoryData = categories.map((e) => e as CategoryData).toList();
      });
    }
    // print('${categoryData?[0].cGrpName} cats');
    print(categoryData?[0]['cGrpName']);
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: categoryData != null
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
              itemCount: categoryData?.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ItemScreen(
                              title: '${categoryData![index]['cGrpName']}',
                              id: categoryData![index]['nItemGrpId']))),
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: (categoryData![index]['cGroupImage']
                                      .toString()
                                      .isNotEmpty &&
                                  categoryData![index]['cGroupImage'] != null)
                              ? CachedNetworkImage(
                                  imageUrl: categoryData![index]['cGroupImage'],
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset('assets/no_image.png'),
                                )
                              : Image.asset('assets/no_image.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(categoryData![index]['cGrpName']),
                        )
                      ],
                    ),
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
