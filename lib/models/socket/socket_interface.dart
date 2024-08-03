enum SocketInterface {
  control(port: 1234),
  testing(port: 9999);

  const SocketInterface({
    required this.port,
  });

  final int port;

  String getUrl(String address) => 'http://$address:$port';
}
