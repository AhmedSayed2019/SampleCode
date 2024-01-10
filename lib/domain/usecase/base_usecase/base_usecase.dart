

import '../../../data/model/base/base_model.dart';
import '../../../data/model/base/response_model.dart';

mixin BaseUseCase<R>{
  ResponseModel<R> onConvert(BaseModel baseModel);
  // Future<ResponseModel<R>> call(Object other) ;

}
