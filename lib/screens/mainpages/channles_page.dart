import 'package:flutter/material.dart';
import 'package:odtv_final_ui/my_network.dart';

class ChannelsPage extends StatefulWidget {
  const ChannelsPage({Key? key}) : super(key: key);

  @override
  State<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            color: const Color(0xff000000).withOpacity(0.70),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: MyNetowrk.categorys.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Card(
                color: Colors.transparent,
                child: ListTile(
                  onTap: () => {print("tesing")},
                  leading: const Icon(
                    Icons.tv,
                    size: 30,
                  ),
                  isThreeLine: true,
                  subtitle: const Text("test"),
                  title: Text(MyNetowrk.categorys[index].name),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: const Color(0xff4A4A4A).withOpacity(0.70),
          ),
        ),
      ],
    );
  }
}
