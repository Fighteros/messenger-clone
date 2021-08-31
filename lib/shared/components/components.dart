import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// get default Login Btn
Widget getDefaultButton({
  required String titleText,
  Color? color = Colors.blue,
  VoidCallback? onPressed,
  Color fontColor = Colors.white,
  FontWeight fontWeight = FontWeight.bold,
  double fontSize = 13.0,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: color,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 40.0,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          titleText,
          style: TextStyle(
              color: fontColor, fontWeight: fontWeight, fontSize: fontSize),
        ),
      ),
    );

// get default TextForm Field
Widget getDefaultTextFormField({
  required TextEditingController controller,
  required String hintText,
  required Function(String? val) validator,
  Function(dynamic val)? onChanged,
  TextInputType? keyboardType,
  bool obscureText = false,
  bool isCollapsed = false,
}) =>
    TextFormField(
      validator: (value) => validator(value),
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      decoration: isCollapsed
          ? InputDecoration.collapsed(hintText: hintText)
          : InputDecoration(
              hintText: hintText,
            ),
    );

Widget buildChatItem({
  required context,
   model,
}) => GestureDetector(
  onTap: () {
    /*Navigator.push(
        screenContext,
        MaterialPageRoute(
            builder: (screenContext) => SingleChatScreen()));*/
  },
  child: Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://scontent.fcai20-4.fna.fbcdn.net/v/t1.6435-1/p100x100/129724210_4256347884381296_6719747894575005085_n.jpg?_nc_cat=104&ccb=1-4&_nc_sid=7206a8&_nc_eui2=AeF_MuvjwyGJd2QpyAKVR_iwQf45cPCMVgdB_jlw8IxWBxF4MZ4mr8OETdiRirJkdccVVo_h82bZabz-m-1Tb6X9&_nc_ohc=A2bCapDIVSgAX_yw-Zu&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fcai20-4.fna&oh=8f7a6c0c86f8c7ccbf8accad23d91909&oe=61327122'),
          ),
          Padding(
            padding:
            const EdgeInsetsDirectional.only(bottom: 1.0, end: 1.0),
            child: CircleAvatar(
              radius: 9.5,
              backgroundColor: Colors.white,
            ),
          ),
          Padding(
            padding:
            const EdgeInsetsDirectional.only(bottom: 2.0, end: 2.0),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 15.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Eng. Mohamed Menem",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  "You:  ❤يارب يا بشمهندس والله",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 3.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                "1m",
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

Widget buildStoryItem({
  required context,
   model,
}) => GestureDetector(
  onTap: () {
  /*  Navigator.push(
        screenContext,
        MaterialPageRoute(
            builder: (screenContext) => SingleChatScreen()));*/
  },
  child: Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://scontent.fcai20-4.fna.fbcdn.net/v/t1.6435-1/p100x100/129724210_4256347884381296_6719747894575005085_n.jpg?_nc_cat=104&ccb=1-4&_nc_sid=7206a8&_nc_eui2=AeF_MuvjwyGJd2QpyAKVR_iwQf45cPCMVgdB_jlw8IxWBxF4MZ4mr8OETdiRirJkdccVVo_h82bZabz-m-1Tb6X9&_nc_ohc=A2bCapDIVSgAX_yw-Zu&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fcai20-4.fna&oh=8f7a6c0c86f8c7ccbf8accad23d91909&oe=61327122'),
            ),
            Padding(
              padding:
              const EdgeInsetsDirectional.only(bottom: 1.0, end: 1.0),
              child: CircleAvatar(
                radius: 9.5,
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding:
              const EdgeInsetsDirectional.only(bottom: 2.0, end: 2.0),
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "Eng. Mohamed Menem",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
);



// build story row
Widget getStoryRow({
   List<Map>? stories,
}) => Container(
  height: 100.0,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => buildStoryItem(context: context),
    separatorBuilder: (context, index) => SizedBox(width: 20.0),
    itemCount: 5,
  ),
);


// get chats column

Widget getChatColumn({
  List<Map>? users,
}) => ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) => buildChatItem(context: context),
    separatorBuilder: (context, index) => SizedBox(
      height: 10.0,
    ),
    itemCount: 15);