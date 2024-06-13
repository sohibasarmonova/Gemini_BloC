

import 'package:gemini_bloc/date/models/message_model.dart';
import 'package:gemini_bloc/domain/repositories/have_repository.dart';

class SaveMessageUseCase {
  final HiveRepository repository;

  SaveMessageUseCase(this.repository);

  Future call(MessageModel messageModel) async {
    await repository.saveMessage(messageModel);
  }
}