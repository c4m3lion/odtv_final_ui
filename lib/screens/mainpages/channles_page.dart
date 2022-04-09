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
              itemBuilder: (context, index) {
                return Material(
                  color: index == MyLocalData.selectedChannelPage
                      ? Colors.cyan.withOpacity(0.4)
                      : Colors.transparent,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: () => {
                      setState(() {
                        MyLocalData.selectedChannelPage = index;
                      }),
                    },
                    selected: index == MyLocalData.selectedChannelPage,
                    title: Text(MyNetowrk.categorys[index].name),
                  ),
                );
              },
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
