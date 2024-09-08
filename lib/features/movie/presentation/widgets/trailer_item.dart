import 'package:flutter/material.dart';
import 'package:netplix_app/features/movie/domain/entities/trailer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerItem extends StatefulWidget {
  const TrailerItem({super.key, required this.trailer});

  final Trailer trailer;

  @override
  State<TrailerItem> createState() => _TrailerItemState();
}

class _TrailerItemState extends State<TrailerItem> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId =
        YoutubePlayer.convertUrlToId(widget.trailer.youtubeVideoId ?? '');

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        disableDragSeek: true,
        autoPlay: false,
        // captionLanguage: 'id',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: YoutubePlayer(
        width: maxWidth - 32,

        controller: _controller,
        // progressIndicatorColor: AppColor.primaryColor500,

        // progressColors: ProgressBarColors(
        //   playedColor: AppColor.primaryColor500,
        //   handleColor: AppColor.primaryColor500,
        // ),

        showVideoProgressIndicator: true,
      ),
    );
  }
}
