import 'package:dartz/dartz.dart';
import 'package:gemini_bloc/date/datasources/local/have_service.dart';
import 'package:gemini_bloc/date/models/message_model.dart';
import 'package:gemini_bloc/domain/repositories/have_repository.dart';

class HiveRepositoryImplementation extends HiveRepository {
  @override
  Future<Either<String, List<MessageModel>>> getMessages() async {
    try {
      var messages = HiveService.getMessages();
      return Right(messages);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> saveMessage(MessageModel messageModel) async {
    HiveService.saveMessage(messageModel);
  }
}