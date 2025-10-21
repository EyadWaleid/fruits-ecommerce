class ReviewProductEntity{
  final String name;
  final String? image;
  final String description;
  final num raiting;
  final String date;

  ReviewProductEntity({
    required this.name,
    this.image,
    required this.description,
    required this.raiting,
    required this.date,
});

}