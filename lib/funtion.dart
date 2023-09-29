import 'package:http/http.dart' as http;

fetchdata(String url) async {
  print("ok");
  try {
    // http.Response response = await http.get(Uri.parse(url));
    var client = http.Client();
    final response = await client.get(Uri.parse(url));
    print(response.toString());
    print(" ok");
    return response.body;
  }
  catch(e)
  {
    return(e.toString());
  }
}
