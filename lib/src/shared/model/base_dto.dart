import 'dart:collection';

abstract interface class BaseDto<TModel> {
  TModel toModel();
}

abstract class BaseModelList<TDto extends BaseDto<TModel>, TModel> //
    extends BaseDto<List<TModel>> with ListMixin<TDto> {
  BaseModelList();
  final List<TDto> l = [];

  @override
  set length(int newLength) {
    l.length = newLength;
  }

  @override
  int get length => l.length;
  @override
  TDto operator [](int index) => l[index];
  @override
  void operator []=(int index, TDto value) {
    l[index] = value;
  }

  @override
  List<TModel> toModel() => l.map((e) => e.toModel()).toList();
}
