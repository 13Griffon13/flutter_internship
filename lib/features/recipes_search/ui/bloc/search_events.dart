
abstract class SearchEvent{

}

class RequestSent extends SearchEvent{
  String request;

  RequestSent(this.request);
}
