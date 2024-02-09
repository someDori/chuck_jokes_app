class RandomJoke {
  final List<String> categories;
  final String? created_at;
  final String? icon_url;
  final String? id;
  final String? updated_at;
  final String? url;
  final String? value;

  const RandomJoke({
    required this.categories,
    this.created_at,
    this.icon_url,
    this.id,
    this.updated_at,
    this.url,
    this.value,
  });
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
