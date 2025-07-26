class Cat {
  final String name;
  final String imageUrl; // Path to the cat's image asset
  final String description; // Optional: add more properties later
  // Add more properties for gacha-related stats, rarity, etc. later

  const Cat({
    required this.name,
    required this.imageUrl,
    this.description = '', // Provide a default or make it required
  });
}
//WIP