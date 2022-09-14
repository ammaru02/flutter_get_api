import 'package:flutter/material.dart';

class Customdetail extends StatelessWidget {
  final String nama;
  final String stambuk;
  final String major;
  final String gender;
  final String address;
  const Customdetail({
    Key? key,
    required this.nama,
    required this.stambuk,
    required this.major,
    required this.gender,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailTextWidget(name: "Nama:", value: nama),
          DetailTextWidget(name: "Stanbuk:", value: stambuk),
          DetailTextWidget(name: "Major:", value: major),
          DetailTextWidget(name: "Gender:", value: gender),
          DetailTextWidget(name: "Address:", value: address),
        ],
      ),
    );
  }
}


class DetailTextWidget extends StatelessWidget {
  final String name,value;
  const DetailTextWidget({Key? key, required this.name, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
         Expanded(
           child: Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
        ),
         ),
        // Spacer(),
        // SizedBox(width: 12,),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
        // Spacer(),
      ],
    );
  }
}

