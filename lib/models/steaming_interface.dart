enum StreamingInterface {
  color(path: '/color'),
  depth(path: '/depth'),
  ;

  const StreamingInterface({
    required this.path,
  });

  static int port = 8554;
  final String path;

  String getUrl(String address) => 'rtsp://$address:$port/streaming$path';
}
