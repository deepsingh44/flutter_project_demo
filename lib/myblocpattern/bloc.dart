import 'package:equatable/equatable.dart';
import 'package:expense_project_flutter/myblocpattern/repo.dart';
import 'package:expense_project_flutter/myblocpattern/student.dart';
import 'package:bloc/bloc.dart';

class StudentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllStudent extends StudentEvent {}

class StudentIsNotSearched extends StudentState {}

class StudentIsNotLoaded extends StudentState {}

class StudentIsLoading extends StudentState {}

class StudentIsLoaded extends StudentState {
  final _students;

  StudentIsLoaded(this._students);

  List<Student> get getStudents => _students;

  @override
  List<Object> get props => [_students];
}

class StudentState extends Equatable {
  @override
  List<Object> get props => [];
}

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  Repo repo;

  StudentBloc(this.repo);

  @override
  StudentState get initialState => StudentIsNotSearched();

  @override
  Stream<StudentState> mapEventToState(StudentEvent event) async*{
    if (event is FetchAllStudent) {
      yield StudentIsLoading();
      try {
        List<Student> students = await repo.getAllStudent();
        yield StudentIsLoaded(students);
      } catch (_) {
        print(_);
        yield StudentIsNotLoaded();
      }
    }
  }
}
