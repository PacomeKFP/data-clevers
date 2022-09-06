

class HeadersConfig{
  static Map<String, Object>  headers({String method = "GET"}) => {
    'Content-type':'application/json; charset=utf-8',
    'Access-control-allow-origin' : '*',
    'Access-control-allow-method' : '*',
    'server':'The KFP Dart server',
    'date':DateTime.now().toString(),
  };
}