abstract class ResponseMapper<ResponseDTO, Response> {
  ResponseDTO mapResponse({required Response from});
}

abstract class RequestMapper<Request, RequestDTO> {
  Request mapResponse({required RequestDTO from});
}

abstract class BaseMapper<ResponseDTO, Response, Request, RequestDTO> implements ResponseMapper, RequestMapper {}
