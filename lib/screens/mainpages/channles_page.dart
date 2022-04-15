import 'package:cached_network_image/cached_network_image.dart';
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
              itemCount: MyNetwork.categorys.length,
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
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
                    title: Text(MyNetwork.categorys[index].name),
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
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: MyNetwork.currentChannels.length,
              controller: ScrollController(),
              itemBuilder: (context, index) {
                print(MyNetwork.currentChannels[index].icon);
                return Material(
                  color: Colors.transparent,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text(MyNetwork.currentChannels[index].name),
                    onTap: () => {
                      MyNetwork.currentChanel =
                          MyNetwork.currentChannels[index],
                      Navigator.pushNamed(context, '/video'),
                    },
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        MyNetwork.channels[index].icon,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
