import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_interface/bloc/search_interface_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_interface/bloc/search_interface_event.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_interface/bloc/search_interface_state.dart';
import 'package:internship_final_recipes/translations/locale_keys.g.dart';

class SearchInterface extends StatelessWidget {
  final SearchInterfaceBloc interfaceBloc = SearchInterfaceBloc();
  final Function(String) onRequestSent;
  SearchInterface({
    Key? key,
    required this.onRequestSent,
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
            hintText: LocaleKeys.searchHint.tr(),
          ),
          onChanged: (value) {
            bloc.add(SearchInterfaceEvent.requestChanged(value));
          },
        );
      },
    );
  }
}
