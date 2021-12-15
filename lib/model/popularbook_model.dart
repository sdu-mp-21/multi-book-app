class PopularBookModel {
  String title, author, price, image, description;
  int color;

  PopularBookModel(this.title, this.author, this.price, this.image, this.color,
      this.description);
}

List<PopularBookModel> populars = popularBookData
    .map((item) => PopularBookModel(item['title'] as String, item['author'] as String,
    item['price'] as String, item['image'] as String, item['color'] as int, item['description'] as String))
    .toList();

var popularBookData = [
  {
    "title": "Jujutsu Kaisen",
    "author": "Гэгэ Акутами",
    "price": "20",
    "image": "assets/images/Volume_1.png",
    "color": 808080,
    "description":
    "Юдзи Итадори — атлетически сложенный старшеклассник, живущий в Сендае вместе со своим дедушкой. Из-за своей нелюбви к спорту он постоянно избегает школьной команды по легкой атлетике, хоть и обладает сверхчеловеческой физической силой. Вместо этого он присоединяется к школьному клубу изучения оккультизма, зависает со старшеклассниками в нём и ровно в 17:00 уходит из школы, чтобы навестить своего дедушку в больнице. На смертном одре дед оставляет Юдзи два наказа: «Всегда помогай людям» и «Умри, окружённый людьми». После его смерти подросток сводит для себя их в одно: каждый человек должен «уйти из жизни достойно»"
  },
  {
    "title": "My Hero Academia",
    "author": "Кохэем Хорикоси",
    "price": "40",
    "image": "assets/images/Volume_2.png",
    "color": 0xFF2B325C,
    "description":
     "Действие происходит в мире, где большинство людей рождается с необычной способностью, которая называется «причуда» (яп. 個性 Косэй, досл. «индивидуальность, индивидуальный характер; характерные черты»)."
  },
  {
    "title": "One Piece",
    "author": "Эйитиро Оды",
    "price": "60",
    "image": "assets/images/Volume_3.png",
    "color": 0xFFF7EA4A,
    "description":
     "Сюжет сериала начинается с казни Короля пиратов Гол Д. Роджера, сумевшего получить богатство, славу и власть. Когда ему дают право последнего слова, он объявляет, что спрятал своё главное сокровище «Ван-Пис» в неком месте, и призывает всех его найти."
  }
];