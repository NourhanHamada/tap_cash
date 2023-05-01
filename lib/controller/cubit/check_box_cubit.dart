import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'check_box_state.dart';

class CheckBoxCubit extends Cubit<CheckBoxState> {
  CheckBoxCubit() : super(CheckBoxInitial());

  CheckBoxCubit get(context) => BlocProvider.of(context);

  bool isChecked = false;

  void changeCheckBoxValue(value){
    isChecked == value;
    isChecked != isChecked;
    print('done');
    emit(CheckBoxChangeValue());
  }

}
