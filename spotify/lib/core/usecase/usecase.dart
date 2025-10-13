abstract class Usecase<TypeOf, Params> {
  Future<TypeOf> call({Params params});
}
