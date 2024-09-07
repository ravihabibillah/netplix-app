import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netplix_app/features/movie/presentation/bloc/now_playing/bloc/now_playing_bloc.dart';
import 'package:netplix_app/injection.dart' as inject;
import 'package:provider/single_child_widget.dart';

class ProviderSetting {
  static List<SingleChildWidget> mainProvider = [
    BlocProvider(
      create: (_) => inject.locator<NowPlayingBloc>(),
    ),
  ];
}
