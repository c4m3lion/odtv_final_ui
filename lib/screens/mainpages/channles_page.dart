import 'package:fluent_ui/fluent_ui.dart';

class ChannelsPage extends StatefulWidget {
  const ChannelsPage({Key? key}) : super(key: key);

  @override
  State<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xff000000).withOpacity(0.70),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xff4A4A4A).withOpacity(0.70),
            ),
          ),
        ],
      ),
    );
  }
}
