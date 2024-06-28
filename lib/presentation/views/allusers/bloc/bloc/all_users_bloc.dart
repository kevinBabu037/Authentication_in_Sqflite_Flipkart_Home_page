import 'package:bloc/bloc.dart';
import 'package:flipkart_home/data/model/user_model.dart';
import 'package:flipkart_home/data/sqflite_service/sqflite.dart';
import 'package:meta/meta.dart';

part 'all_users_event.dart';
part 'all_users_state.dart';

class AllUsersBloc extends Bloc<AllUsersEvent, AllUsersState> {
  AllUsersBloc() : super(AllUsersInitial()) {
 
   SqfliteService service = SqfliteService();

    on<GetAllUsersEvent>((event, emit)async {
       emit(AllUsersLoadingState()); 
  
      List<UserModel> userList = await service.getAllUsers();
 
      if (userList.isNotEmpty) {
       emit(AllUsersSuccessState(users: userList));
     }else{
      emit(AllUsersErrorState());
     }

    });
  }
}
