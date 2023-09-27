import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegetarianFree, veganFree }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarianFree: false,
          Filter.veganFree: false,
        });
  // Avoid mutating state
  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; //not allowed! => mutating state
    state = {...state, filter: isActive};
  }
  //
  void setFilters(Map<Filter, bool> chosenFilters){
    state = chosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());
