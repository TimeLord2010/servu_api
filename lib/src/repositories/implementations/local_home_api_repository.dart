import '../../data/api/carousel_image.dart';
import '../models/home_api_model.dart';

class LocalHomeApiRepository extends HomeApiModel {
  @override
  Future<Iterable<CarouselImage>> getCarousel() async {
    var items = List.generate(5, (i) {
      var url = 'https://picsum.photos/444/250';
      return CarouselImage(
        url: url,
        link: '',
      );
    });
    return items;
  }
}
