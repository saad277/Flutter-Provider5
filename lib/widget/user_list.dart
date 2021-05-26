import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prov/provider/user_notifier.dart';

//consumer can only be wrapped around widgets

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("userList rebuild");

    //  UserNotifier userNotifier = Provider.of<UserNotifier>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext, index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //can listen for state changes in both ways
                Text(
                  'Name: ${context.watch<UserNotifier>().userList[index].name}',
                  style: TextStyle(fontSize: 18),
                ),
                Consumer<UserNotifier>(
                  builder: (_, notifier, __) => Text(
                    'Name: ${notifier.userList[index].city}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ]),
              // Consumer<UserNotifier>(
              //     builder: (_, notifier, __) => IconButton(
              //           onPressed: () => notifier.deleteUser(index),
              //           icon: Icon(Icons.delete),
              //         )),
              IconButton(
                onPressed: () => context.read<UserNotifier>().deleteUser(index),
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
      // itemCount: userNotifier.userList.length,
      itemCount: context.watch<UserNotifier>().userList.length,
    );
  }
}
