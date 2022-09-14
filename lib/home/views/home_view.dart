import 'package:flutter/material.dart';
import 'package:flutter_get_api/home/providers/mahasiswa_provider.dart';
import 'package:flutter_get_api/home/views/detail_view.dart';

import '../../utils/utils.dart';
import '../models/model_mahasiswa.dart';
import 'input_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.person,
              color: Colors.blue,
              size: 35,
            ),
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Home View',style: TextStyle(color: Colors.black),),
            Text(
              'Admin',
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
            Text('List Mahasiswa',style: TextStyle(fontSize: 20, color: Colors.black)),
          ],
        ),
        centerTitle: false,
      ),
      body: FutureBuilder<List<Mahasiswa>>(
        future: MahasiswaProvider.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListViewWidget(list: snapshot.data ?? []);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InputView(),
              ));
        },
        label: Row(
          children: const [
            Icon(Icons.add),
            Text(
              'Tambah Data',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  final List<Mahasiswa> list;

  const ListViewWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final data = list[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          elevation: 10,
          child: ListTile(
            onTap: () => Utils.routerPush(
              DetailView(
                mahasiswa: data,
              ),
              context,
            ),
            title: Text(data.namaMhs),
            subtitle: Text(data.stbMhs),
          ),
        );
      },
    );
  }
}
