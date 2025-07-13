abstract class UsecaseCommon<ReturnType, Params> {
  Future<ReturnType> call(Params params);
}
