class ChatMessage {
  // dados da menssagem
  final String id;
  final String text;
  final DateTime createAt;
  //dados do usuário
  final String userId;
  final String userName;
  final String userImageURL;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.createAt,
    required this.userId,
    required this.userName,
    required this.userImageURL,
  });
}
