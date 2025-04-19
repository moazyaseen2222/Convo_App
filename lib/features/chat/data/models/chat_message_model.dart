class ChatMessageModel {
  late String content;
  late String timeOfSend;
  late bool isOwner;

  ChatMessageModel(
      {required this.content, required this.timeOfSend, required this.isOwner});
}
