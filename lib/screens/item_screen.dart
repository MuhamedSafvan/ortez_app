import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ortez_app/providers/api_provider.dart';

class ItemScreen extends StatefulWidget {
  String? title;
  int? id;

  ItemScreen({Key? key, this.title, this.id}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  List? itemData;

  Future getItems() async {
    var items = await ApiProvider().getItems(itemGroupId: widget.id);
    if (mounted) {
      setState(() {
        itemData = items;
        // categoryData = categories.map((e) => e as CategoryData).toList();
      });
    }
    // print('${categoryData?[0].cGrpName} cats');
    print(itemData);
  }

  @override
  void initState() {
    getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: itemData != null
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
              itemCount: itemData?.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: (itemData![index]['cItemImage']
                                  .toString()
                                  .isNotEmpty && itemData![index]['cItemImage'] != null)
                              ? CachedNetworkImage(
                                  imageUrl: itemData![index]['cItemImage'],
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset('assets/no_image.png'),
                                )
                              : Image.asset('assets/no_image.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(itemData?[index]['cItemName']),
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
