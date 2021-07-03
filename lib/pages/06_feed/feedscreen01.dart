import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedScreen01 extends StatefulWidget {
  FeedScreen01({Key? key}) : super(key: key);

  @override
  _FeedScreen01State createState() => _FeedScreen01State();
}

class _FeedScreen01State extends State<FeedScreen01> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Feed", style: TextStyle(color: Colors.black)),
          titleSpacing: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return PostItem();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = new DateTime.now().subtract(new Duration(minutes: 15));

    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // replace avatar image here
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 16.0, bottom: 2.0),
                          // replace display name here
                          child: Text(
                            "John Doe",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 2.0),
                          child: Text(timeago.format(fifteenAgo), style: TextStyle(fontSize: 12.0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: constraints.maxWidth,
                // replace image
                child: Image.asset(
                  'assets/images/placeholder.png',
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.thumbsUp),
                        onPressed: () {
                          // place link function here
                        },
                      ),
                      Text("Like")
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.comment),
                        onPressed: () {
                          // place comment function here
                        },
                      ),
                      Text("Comment")
                    ],
                  ),
                  Spacer(),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.share),
                        onPressed: () {
                          // place comment function here
                        },
                      ),
                      Text("Share")
                    ],
                  ),
                  SizedBox(width: 8.0)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
