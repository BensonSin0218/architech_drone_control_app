enum SocketEvent {
  connectionInfo(event: "connection/info"),
  publish(event: "publish"),
  subscribe(event: "subscribe"),
  dummy(event: "dummy");

  const SocketEvent({
    required this.event,
  });

  final String event;
}
