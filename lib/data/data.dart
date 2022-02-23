enum AnimalType { land, air , fire, ice, a,b,c}

class Animal {
  final String imageUrl;
  final AnimalType type;

  Animal({
    required this.imageUrl,
    required this.type,
  });
}

final allAnimals = [
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/Nature1.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/nature2.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/Nature3.png',
  ),
];

final birdAnimals = [
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/bird4.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/bied5.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/bird6.png',
  ),
];

final landAnimals = [
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/animal3.png',
  ),
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/animal2.png',
  ),
];

final iceAnimals = [

];

final aAnimals = [
  Animal(
    type: AnimalType.a,
    imageUrl: 'assets/images/game1.png',
  ),
  Animal(
    type: AnimalType.a,
    imageUrl: 'assets/images/game2.png',
  ),
  Animal(
    type: AnimalType.a,
    imageUrl: 'assets/images/game3.png',
  ),
];
final bAnimals = [
  Animal(
    type: AnimalType.b,
    imageUrl: 'assets/images/goku1.png',
  ),
  Animal(
    type: AnimalType.b,
    imageUrl: 'assets/images/goku2.png',
  ),
];
final cAnimals = [
  Animal(
    type: AnimalType.c,
    imageUrl: 'assets/images/tiger1.png',
  ),
  Animal(
    type: AnimalType.c,
    imageUrl: 'assets/images/tiger2.png',
  ),
  Animal(
    type: AnimalType.c,
    imageUrl: 'assets/images/tiger3.png',
  ),
];