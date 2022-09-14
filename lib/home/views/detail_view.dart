import 'package:flutter/material.dart';
import 'package:flutter_get_api/home/models/model_mahasiswa.dart';
import 'package:flutter_get_api/home/providers/mahasiswa_provider.dart';
import 'package:flutter_get_api/utils/utils.dart';

import '../../widgets/costume_detail.dart';
import '../../alert/alert.dart';
import 'home_view.dart';
import 'update_view.dart';

class DetailView extends StatelessWidget {
  final Mahasiswa mahasiswa;

  const DetailView({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Customdetail(
              nama: mahasiswa.namaMhs,
              stambuk: mahasiswa.stbMhs,
              major: mahasiswa.majorMhs,
              gender: mahasiswa.genderMhs,
              address: mahasiswa.addressMhs,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Utils.routerPush(
                        UpdateVIew(
                          mahasiswa: mahasiswa,
                        ),
                        context,
                      );
                    },
                    child: const Text("Update"),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      showAlert(
                        context,
                        onpressedok: () async {
                          await MahasiswaProvider.deleteData(mahasiswa);
                          // ignore: use_build_context_synchronously
                          Utils.routerPush(const HomeView(), context);
                        },
                        onpressedno: (){
                          Navigator.pop(context);
                        }
                      );
                    },

                    child: const Text("Delete"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
