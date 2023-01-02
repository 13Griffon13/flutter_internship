import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_interface/bloc/search_interface_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_interface/bloc/search_interface_event.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_interface/bloc/search_interface_state.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/util/sort_types.dart';
import 'package:internship_final_recipes/locale/locale.dart';

class SearchInterface extends StatelessWidget {
  final SearchInterfaceBloc interfaceBloc = SearchInterfaceBloc();
  final Function(String) onRequestSent;
  final Function(SortType) onSortTypeChanged;

  SearchInterface({
    Key? key,
    required this.onRequestSent,
    required this.onSortTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchInterfaceBloc, SearchInterfaceState>(
      bloc: interfaceBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  child: _RequestField(
                bloc: interfaceBloc,
                onListenerTriggered: onRequestSent,
              )),
              _SortSelector(
                bloc: interfaceBloc,
                onListenerTriggered: onSortTypeChanged,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RequestField extends StatelessWidget {
  final Function(String) onListenerTriggered;
  final SearchInterfaceBloc bloc;

  const _RequestField({
    Key? key,
    required this.onListenerTriggered,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchInterfaceBloc, SearchInterfaceState>(
      bloc: bloc,
      listenWhen: (previous, current) {
        //todo fix this part
        return current.readyToSend;
      },
      listener: (context, state) {
        onListenerTriggered(state.request);
      },
      buildWhen: (previous, current) {
        return previous.request != current.request;
      },
      builder: (context, state) {
        return TextField(
          decoration: InputDecoration(
            hintText: LocaleStrings.searchHint(),
          ),
          onChanged: (value) {
            bloc.add(SearchInterfaceEvent.requestChanged(value));
          },
        );
      },
    );
  }
}

class _SortSelector extends StatelessWidget {
  final Function(SortType) onListenerTriggered;
  final SearchInterfaceBloc bloc;

  const _SortSelector({
    Key? key,
    required this.onListenerTriggered,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchInterfaceBloc, SearchInterfaceState>(
      bloc: bloc,
      listenWhen: (previous, current) {
        return previous.sortType != current.sortType;
      },
      listener: (context, state) {
        onListenerTriggered(state.sortType);
      },
      buildWhen: (previous, current) {
        return previous.sortType != current.sortType;
      },
      builder: (context, state) {
        return DropdownButton<SortType>(
          value: state.sortType,
          items: SortType.values
              .map((e) => DropdownMenuItem<SortType>(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: (value) {
            bloc.add(
              SearchInterfaceEvent.sortTypeChanged(value ?? SortType.none),
            );
          },
        );
      },
    );
  }
}
