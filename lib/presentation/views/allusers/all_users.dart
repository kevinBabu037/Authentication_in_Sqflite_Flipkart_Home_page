import 'package:flipkart_home/presentation/views/allusers/bloc/bloc/all_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAllUsers extends StatefulWidget {
  const ScreenAllUsers({super.key});

  @override
  State<ScreenAllUsers> createState() => _ScreenAllUsersState();
}
 
class _ScreenAllUsersState extends State<ScreenAllUsers> {


  @override
  void initState() {
   context.read<AllUsersBloc>().add(GetAllUsersEvent());
    super.initState();
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('All Users'),),
      body: BlocBuilder<AllUsersBloc, AllUsersState>(
        builder: (context, state) {
          if (state is AllUsersLoadingState) { 
            return const Center(child:CircularProgressIndicator(),);
          } 
          if (state is AllUsersSuccessState) {
           return ListView.separated(
              itemBuilder: (context, index) { 
                final data = state.users[index];
               return ListTile(
                leading:const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(data.name), 
               ); 
              }, 
              separatorBuilder: (context, index) =>const Divider(thickness: 0.3,), 
              itemCount: state.users.length
              );
          }
          return const Center(child: Text('Fail to fech'),);
        },
      ),
    );
  }
}