import 'package:movies_app/models/models.dart';

class NowPlayinResponse {
    Dates dates;
    int page;
    List<Movie> Movies;
    int totalPages;
    int totalMovies;

    NowPlayinResponse({
        required this.dates,
        required this.page,
        required this.Movies,
        required this.totalPages,
        required this.totalMovies,
    });

    factory NowPlayinResponse.fromJson(String str) => NowPlayinResponse.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory NowPlayinResponse.fromMap(Map<String, dynamic> json) => NowPlayinResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        Movies: List<Movie>.from(json["Movies"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalMovies: json["total_Movies"],
    );

    // Map<String, dynamic> toMap() => {
    //     "dates": dates.toMap(),
    //     "page": page,
    //     "Movies": List<dynamic>.from(Movies.map((x) => x.toMap())),
    //     "total_pages": totalPages,
    //     "total_Movies": totalMovies,
    // };
}

class Dates {
    DateTime maximum;
    DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toMap() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}
