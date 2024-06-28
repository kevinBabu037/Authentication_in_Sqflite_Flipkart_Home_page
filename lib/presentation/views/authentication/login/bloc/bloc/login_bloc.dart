import 'package:bloc/bloc.dart';
import 'package:flipkart_home/data/model/user_model.dart';
import 'package:flipkart_home/data/sqflite_service/sqflite.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {

 SqfliteService service =SqfliteService();

    on<UserLogin>((event, emit)async {
    
    UserModel? res = await service.loginUser(event.email, event.password);

    if (res!=null) {
      emit(LoginSuccessState());
    }else{
      emit(LoginErrorState());
    }

      
    });
  }
}
