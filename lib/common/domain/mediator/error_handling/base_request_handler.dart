
//? This is an attempt to use Either with MediatR 0.2
// abstract class BaseRequestHandler<R, T extends IRequest<R>> extends IRequestHandler<R, T> {
//   @override
//   Future<Either<Failure, R>> call(T request) async {
//     try {
//       return Right();
//     } catch (e) {
//       return Left(Failure(e));
//     }
//   }
// }

// abstract class Failure {
//   final String message;

//   Failure(this.message);
// }
