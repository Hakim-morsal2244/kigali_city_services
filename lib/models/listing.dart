class Listing {

  final String id;
  final String name;
  final String category;
  final String address;
  final String phone;
  final String description;
  final double latitude;
  final double longitude;
  final String createdBy;

  Listing({
    required this.id,
    required this.name,
    required this.category,
    required this.address,
    required this.phone,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.createdBy,
  });

  factory Listing.fromFirestore(Map<String,dynamic> data,String id){

    return Listing(
      id: id,
      name: data['name'],
      category: data['category'],
      address: data['address'],
      phone: data['phone'],
      description: data['description'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      createdBy: data['createdBy'],
    );
  }
}