class Joke {
  const Joke({
    required this.categories,
    this.created_at,
    this.icon_url,
    this.id,
    this.updated_at,
    this.url,
    this.value,
  });
  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      categories: json['categories'] as List<String>,
      created_at: json['created_at'] as String?,
      icon_url: json['icon_url'] as String?,
      id: json['id'] as String?,
      updated_at: json['updated_at'] as String?,
      url: json['url'] as String?,
      value: json['value'] as String?,
    );
  }
  final List<String> categories;
  final String? created_at;
  final String? icon_url;
  final String? id;
  final String? updated_at;
  final String? url;
  final String? value;
}

/*
{
  "categories":[],
  "created_at":"2020-01-05 13:42:19.576875",
  "icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png",
  "id":"OjAI01UsQQeSdrozSnDXLw",
  "updated_at":"2020-01-05 13:42:19.576875",
  "url":"https://api.chucknorris.io/jokes/OjAI01UsQQeSdrozSnDXLw",
  "value":"Shooting stars wish Chuck Norris wouldn't roundhouse kick them."
}
 */
