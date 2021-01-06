import 'package:equatable/equatable.dart';
import 'package:expense_project_flutter/anotherblocpattern/model.dart';
import 'package:bloc/bloc.dart';
import 'package:expense_project_flutter/anotherblocpattern/person_repo.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonRepo personRepo;

  PersonBloc(this.personRepo);

  @override
  PersonState get initialState => PersonIsNotSearched();

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    if (event is FetchAllPerson) {
      yield PersonIsLoading();
      try {
        List<Person> persons = await personRepo.getAllPerson();
        yield PersonIsLoaded(persons);
      } catch (_) {
        print(_);
        yield PersonIsNotLoaded();
      }
    }
    /*else if (event is ResetWeather) {
      yield WeatherIsNotSearched();
    }*/
  }
}

abstract class PersonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//Event class works as input from user
class FetchAllPerson extends PersonEvent {}

//State class works as output
abstract class PersonState extends Equatable {
  @override
  List<Object> get props => [];
}

class PersonIsNotSearched extends PersonState {}

class PersonIsNotLoaded extends PersonState {}

class PersonIsLoading extends PersonState {}

class PersonIsLoaded extends PersonState {
  final _persons;

  PersonIsLoaded(this._persons);

  List<Person> get getPersons => _persons;

  @override
  List<Object> get props => [_persons];
}
