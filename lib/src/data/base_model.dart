import 'dart:collection';

abstract interface class BaseModel<TDomain> {
  TDomain toDomain();
}

abstract class BaseModelList<TModel extends BaseModel<TDomain>, TDomain> extends BaseModel<List<TDomain>>
    with ListMixin<TModel> {
  final List<TModel> l = [];
  BaseModelList();

  @override
  set length(int newLength) {
    l.length = newLength;
  }

  @override
  int get length => l.length;
  @override
  TModel operator [](int index) => l[index];
  @override
  void operator []=(int index, TModel value) {
    l[index] = value;
  }

  @override
  List<TDomain> toDomain() => l.map((e) => e.toDomain()).toList();
}
