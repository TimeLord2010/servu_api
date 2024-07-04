import '../../data/api/carousel_image.dart';

abstract class HomeApiModel {
  Future<Iterable<CarouselImage>> getCarousel();
}
