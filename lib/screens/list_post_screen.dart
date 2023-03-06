import 'package:flutter/material.dart';
import 'package:rojas_johan_practicas/database/database_helper.dart';
import 'package:rojas_johan_practicas/models/post_model.dart';
import 'package:rojas_johan_practicas/widgets/item_post_widget.dart';

class ListPostScreen extends StatefulWidget {
  const ListPostScreen({super.key});

  @override
  State<ListPostScreen> createState() => _ListPostScreenState();
}

class _ListPostScreenState extends State<ListPostScreen> {
  DatabaseHelper? helper;

  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: helper!.GETALLPOST(),
      builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var objPostModel = snapshot.data![index];
              return ItemPostWidget(postModel: objPostModel);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Ocurrio un error en la petición :)'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
