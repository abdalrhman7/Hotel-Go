import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButtonsVisibilityCubit extends Cubit<bool> {
  FilterButtonsVisibilityCubit() : super(true);

  void showFilterButtons() => emit(true);

  void hideFilterButtons() => emit(false);
}
