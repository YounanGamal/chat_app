// import 'package:chat_app/constants.dart';
// import 'package:chat_app/models/message.dart';
// import 'package:chat_app/widgets/chat_buble.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ChatPage extends StatelessWidget {
//   static String id = 'ChatPage';
//
//   final _controller = ScrollController();
//
//   CollectionReference messages =
//       FirebaseFirestore.instance.collection(kMessagesCollections);
//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//  var email  = ModalRoute.of(context)!.settings.arguments ;
//     return StreamBuilder<QuerySnapshot>(
//       stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<Message> messagesList = [];
//           for (int i = 0; i < snapshot.data!.docs.length; i++) {
//             messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
//           }
//
//           return Scaffold(
//             appBar: AppBar(
//               automaticallyImplyLeading: false,
//               backgroundColor: kPrimaryColor,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     kLogo,
//                     height: 50,
//                   ),
//                   Text('chat'),
//                 ],
//               ),
//               centerTitle: true,
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                       reverse: true,
//                       controller: _controller,
//                       itemCount: messagesList.length,
//                       itemBuilder: (context, index) {
//                         return messagesList[index].id == email ?  ChatBuble(
//                           message: messagesList[index],
//                         ) : ChatBubleForFriend(message: messagesList[index]);
//                       }),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: TextField(
//                     controller: controller,
//                     onSubmitted: (data) {
//                       messages.add(
//                         {kMessage: data, kCreatedAt: DateTime.now(), 'id' : email },
//
//                       );
//                       controller.clear();
//                       _controller.animateTo(0,
//                           duration: Duration(milliseconds: 500),
//                           curve: Curves.easeIn);
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'Send Message',
//                       suffixIcon: Icon(
//                         Icons.send,
//                         color: kPrimaryColor,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide(
//                           color: kPrimaryColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Text('Loading...');
//         }
//       },
//     );
//   }
// }

import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/pages/cubit/chat_cubit/chat_cubit.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  final _controller = ScrollController();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)?.settings.arguments as String? ??
        'guest@example.com';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogo, height: 50),
            Text('Chat'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBuble(message: messagesList[index])
                        : ChatBubleForFriend(message: messagesList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: data, email: email);
                controller.clear();
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(Icons.send, color: kPrimaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(kLogo, height: 50),
          Text('Chat'),
        ],
      ),
      centerTitle: true,
    );
  }
}
