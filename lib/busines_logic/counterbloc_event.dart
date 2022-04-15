part of 'counterbloc_bloc.dart';

@immutable
abstract class CounterblocEvent {}

class IncrementCounter extends CounterblocEvent {}

class DecrementCounter extends CounterblocEvent {}
