
class ParseModelRestaurants {
  static Map<String, String> restaurant = {
    "displayName": "TEXT",
    "originalUrl": "TEXT",
    "thumbnailUrl": "TEXT",
    "address": "TEXT",
    "street_number": "TEXT",
    "route": "TEXT",
    "locality": "TEXT",
    "sublocality": "TEXT",
    "country": "TEXT",
    "postal_code": "TEXT",
    "administrative_area": "TEXT",
    "flag": "TEXT"
  };

  @override
  Future<int> upsert(txn) async {

  }

  // length(8)
  final String address;
  final String street_number;
  final String route;
  final String locality;
  final String sublocality;
  final String country;
  final String postal_code;
  final String administrative_area;

  double rating = 4.5;
  int reviews = 80;

  // Common
  final String displayName;
  final String thumbnailUrl;
  final String originalUrl;

  // Attributes
  final geoLocation;

  ParseModelRestaurants(
      {this.address,
      this.street_number,
      this.route,
      this.locality,
      this.sublocality,
      this.country,
      this.postal_code,
      this.administrative_area,
      this.displayName,
      this.geoLocation,
      this.thumbnailUrl,
      this.originalUrl,
        this.reviews = 80,
        this.rating = 4.5,
      });

  factory ParseModelRestaurants.fromJson(Map<String, dynamic> json) {
//    DatabaseBaseModel databaseBaseModel = DatabaseBaseModel.fromJson(json);
    // Attributes
    var displayName = json['displayName'] as String;
    var geoLocation = json['geoLocation'];
    // Google address
    var address = json['address'] as String;
    var street_number = json['street_number'] as String;
    var route = json['route'] as String;
    var locality = json['locality'] as String;
    var sublocality = json['sublocality'] as String;
    var country = json['country'] as String;
    var postal_code = json['postal_code'] as String;
    var administrative_area = json['administrative_area'] as String;

    var thumbnailUrl = json['thumbnailUrl'] as String;
    var originalUrl = json['originalUrl'] as String;
    return ParseModelRestaurants(
        address: address,
        street_number: street_number,
        route: route,
        locality: locality,
        sublocality: sublocality,
        country: country,
        postal_code: postal_code,
        administrative_area: administrative_area,
        displayName: displayName,
        geoLocation: geoLocation,
        thumbnailUrl: thumbnailUrl,
        originalUrl: originalUrl);
  }


  static List<ParseModelRestaurants> restaurantList = <ParseModelRestaurants>[
    ParseModelRestaurants(
      originalUrl: 'assets/hotel/hotel_1.png',
      displayName: 'Grand Royal Hotel',
      locality: 'Wembley, London',
      route: "2.0",
      reviews: 80,
      rating: 4.4,
    ),
    ParseModelRestaurants(
      originalUrl: 'assets/hotel/hotel_2.png',
      displayName: 'Queen Hotel',
      locality: 'Wembley, London',
      route: "2.0",
      reviews: 74,
      rating: 4.5,
    ),
    ParseModelRestaurants(
      originalUrl: 'assets/hotel/hotel_3.png',
      displayName: 'Grand Royal Hotel',
      locality: 'Wembley, London',
      route: "2.0",
      reviews: 62,
      rating: 4.0,
    ),
    ParseModelRestaurants(
      originalUrl: 'assets/hotel/hotel_4.png',
      displayName: 'Queen Hotel',
      locality: 'Wembley, London',
      route: "2.0",
      reviews: 90,
      rating: 4.4,
    ),
    ParseModelRestaurants(
      originalUrl: 'assets/hotel/hotel_5.png',
      displayName: 'Grand Royal Hotel',
      locality: 'Wembley, London',
      route: "2.0",
      reviews: 240,
      rating: 4.5,
    ),
  ];




}
