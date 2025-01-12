
class ApiURL{

  static const String _baseURL = "https://www.googleapis.com/books/v1/volumes";

  String get baseURL => _baseURL;

  static const String _apiKey = "AIzaSyD7_x_bXE-5iENpPWhMe-LXT7tuW0uAuXs";

  static String get bookList => "$_baseURL?q=harry+potter&maxResults=40&key=$_apiKey";

  static String get specificBook => "$_baseURL";

}