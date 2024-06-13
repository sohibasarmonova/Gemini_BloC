import 'package:dartz/dartz.dart';
import 'package:gemini_bloc/date/models/message_model.dart';
import 'package:gemini_bloc/domain/repositories/have_repository.dart';


class GetMessagesDbUseCase {
  final HiveRepository repository;

  GetMessagesDbUseCase(this.repository);

  Future<Either<String, List<MessageModel>>> call() async {
    return await repository.getMessages();
  }
}