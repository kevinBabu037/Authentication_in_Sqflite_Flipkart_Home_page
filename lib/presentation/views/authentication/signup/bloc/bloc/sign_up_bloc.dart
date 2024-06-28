import 'package:bloc/bloc.dart';
import 'package:flipkart_home/data/model/user_model.dart';
import 'package:flipkart_home/data/sqflite_service/sqflite.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {


     SqfliteService service =SqfliteService();

    on<UserSignUpEvent>((event, emit) async{

      emit(SignUpLoadingState()); 

     final res = await service.addUser(event.user);

    
      // ignore: unnecessary_null_comparison
      if (res!=null) {
        emit(SignUpSuccessState());
      }else{
        emit(SignUpErrorState());
      }
       
    });
  }
} 
