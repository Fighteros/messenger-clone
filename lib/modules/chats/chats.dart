import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_mini_clone/modules/single_chat_screen/SingleChatScreen.dart';
import 'package:messenger_mini_clone/shared/components/components.dart';
import 'package:messenger_mini_clone/shared/cubit/cubit.dart';
import 'package:messenger_mini_clone/shared/cubit/states.dart';

class ChatsScreen extends StatelessWidget {
  var screenContext;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    screenContext = context;
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 50.0,
            iconSize: 30.0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidComment,
                    ),
                    Container(
                      width: 18.0,
                      height: 18.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    Container(
                      width: 15.0,
                      height: 15.0,
                      decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.only(end: 2.0, bottom: 1.0),
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.userFriends,
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.only(start: 5.0, bottom: 5.0),
                      child: Container(
                        width: 24.0,
                        height: 22.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.only(end: 1.0, bottom: 1.0),
                      child: Text(
                        '66',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                label: 'People',
              ),
            ],
          ),
          appBar: AppBar(
            titleSpacing: 16.0,
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 15.0,
                  backgroundImage: NetworkImage(
                      'https://scontent.fcai20-4.fna.fbcdn.net/v/t1.6435-1/p100x100/167878827_798492194400631_6227604413675121542_n.jpg?_nc_cat=110&ccb=1-4&_nc_sid=7206a8&_nc_eui2=AeHsDjw108P0MitKBM9wcdFiQ_9k_VY77ShD_2T9VjvtKA84dlBsflkxFA07LmSrs7jnlostmZeWtoszIpJ0jjxf&_nc_ohc=9t2EC9N4toIAX-7Qkpd&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fcai20-4.fna&oh=e86cc009dd85dd68133b01b404567729&oe=613240FF'),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Chats",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            actions: [
              IconButton(
                iconSize: 40.0,
                splashRadius: 21.0,
                icon: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                    size: 20.0,
                  ),
                ),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 40.0,
                splashRadius: 21.0,
                icon: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 20.0,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // search box
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey[700],
                            ),
                            SizedBox(
                              width: 7.0,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0)),
                      height: 40.0,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Stories Row
                    getStoryRow(),
                    SizedBox(
                      height: 40.0,
                    ),
                    //  chats
                    getChatColumn(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  // 1. build item
  // 2.  build list
  // 3. add item to list
  // reusable item

}
