import 'package:flutter/material.dart';
import 'package:json_api/Service/userService.dart';
import 'package:json_api/model/userModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService _service = UserService();
  List<Data> users = [];
  bool? isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service.fectUsers().then(
      (value) {
        if (value != null && value.data != null) {
          setState(() {
            users = value.data!;
            isLoading = true;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : isLoading == true
              ? ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${users[index].firstName}  ${users[index].lastName}'),
                      subtitle: Text('${users[index].email}'),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('${users[index].avatar}'),
                      ),
                    );
                  },
                )
              : const Center(child: Text('Bir sorun  Oluştu')),
    );
  }
}
