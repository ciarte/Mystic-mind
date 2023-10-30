import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as Math;
import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/providers/providers.dart';

class TarotScreen extends ConsumerStatefulWidget {
  const TarotScreen({super.key});

  @override
  TarotScreenState createState() => TarotScreenState();
}

class TarotScreenState extends ConsumerState<TarotScreen> {
  bool _isCardSelected = false;
  void activateAnimation(String desc) {
    setState(() {
      _isCardSelected = true;
      _showSnackBar(desc);
    });
  }

  void _showSnackBar(String desc) {
    Future.delayed(const Duration(milliseconds: 2200), () {
      ScaffoldMessenger.of(context)
          .hideCurrentSnackBar(); // Asegúrate de ocultar el Snackbar anterior antes de mostrar el nuevo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          closeIconColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0)),
          ),
          duration: const Duration(milliseconds: 20000),
          elevation: 3,
          // action: SnackBarAction(
          //   label: Icon(Icons.close_rounded),
          //   textColor: Colors.red,
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
          //   },
          // ),
          backgroundColor: const Color.fromARGB(255, 202, 140, 137),
          content: Container(height: 200, child: Text(desc)),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final tarot = ref.watch(tarotCardsProvider);
    final tarots = ref.watch(tarotThreeCardsProvider);
    final isDarkmode = ref.watch(darkModeProvider);
    final description = ref.watch(animatedStartProvider);
    final image = ref.watch(imageTarotStartProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tarot'),
        ),
        body: Stack(
          children: [
            Container(
              decoration: !isDarkmode
                  ? const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/fondo.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.linearToSrgbGamma(),
                          opacity: 0.5),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.decal,
                          stops: [
                            0.1,
                            0.6
                          ],
                          colors: [
                            Color.fromRGBO(254, 211, 170, 1),
                            Color.fromRGBO(191, 141, 187, 1),
                          ]))
                  : const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/fondo.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.linearToSrgbGamma(),
                          opacity: 0.5),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.decal,
                          stops: [
                            0.1,
                            0.6
                          ],
                          colors: [
                            Color.fromRGBO(155, 85, 148, 1),
                            Color.fromRGBO(23, 5, 66, 1),
                          ])),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'Elije una carta para obtener una lectura',
                              cursor: '.',
                              speed: const Duration(milliseconds: 70),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18)),
                        ],
                      )),
                  //tarjeta
                  Container(
                      height: 255,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          border: Border.all(
                            color: const Color.fromRGBO(
                              168,
                              168,
                              168,
                              1,
                            ),
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: _isCardSelected
                          ? _CardDescription(
                              description: description,
                              image: image,
                            )
                          : const SizedBox(
                              height: 200,
                            )),
                ],
              ),
            ),
            _CardsTable(
              tarots: tarots,
              isCardSelected: _isCardSelected,
            ),
          ],
        ));
  }
}

class _CardsTable extends StatelessWidget {
  const _CardsTable({
    super.key,
    required this.tarots,
    required this.isCardSelected,
  });

  final AsyncValue<List<Tarot>> tarots;
  final bool isCardSelected;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 250,
      bottom: 0,
      left: 0,
      right: 0,
      child: Stack(
        alignment: Alignment.topCenter, // Alineación de las cartas
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 0),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(167, 12, 56, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(150),
                topRight: Radius.circular(150),
              ),
            ),
            height: 300,
          ),
          if (isCardSelected) AnimatedCard(),
          SizedBox(
            height: 300,
            child: tarots.when(
              data: (data) => _TarotCards(data: data),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (Object error, StackTrace stackTrace) => Text('$error'),
            ),
          ),
        ],
      ),
    );
  }
}

//carta en la mesa
class _TarotCards extends ConsumerWidget {
  final List<Tarot> data;
  const _TarotCards({super.key, required this.data});

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    // ref.watch(animatedStartProvider);
    return SizedBox(
        height: 250,
        width: double.infinity,
        child: Swiper(
            loop: true,
            layout: SwiperLayout.CUSTOM,
            customLayoutOption:
                CustomLayoutOption(startIndex: -1, stateCount: 3)
                  ..addRotate([-0.3, 0.0, 0.3])
                  ..addTranslate([
                    const Offset(-180.0, -15.0),
                    const Offset(0.0, 0.0),
                    const Offset(180.0, -15.0)
                  ]),
            itemWidth: 200.0,
            itemHeight: 250.0,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () async {
                    ref
                        .read(imageTarotStartProvider.notifier)
                        .changeImageTarot((data[index].sequence).toString());
                    ref
                        .read(animatedStartProvider.notifier)
                        .changeTarot(data[index].desc);
                    final state =
                        context.findAncestorStateOfType<TarotScreenState>();
                    state?.activateAnimation(data[index].desc);

                    print('ESTO ES LA CARTA ${data[index].name}');
                  },
                  child: const _CardImage());
            }));
  }
}

class _CardImage extends ConsumerWidget {
  const _CardImage();

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    final isDarkmode = ref.watch(darkModeProvider);
    return Image.asset(isDarkmode
        ? 'assets/tarot_cards/dark.png'
        : 'assets/tarot_cards/light.png');
  }
}

class _CardDescription extends StatefulWidget {
  final String description;

  final String image;

  const _CardDescription({required this.image, required this.description});

  @override
  State<_CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<_CardDescription> {
  double opacityLevel = 0.0;

  void initState() {
    super.initState();
    // Agrega un tiempo de espera antes de que aparezca el widget
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: opacityLevel,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 260,
          width: 230,
          child: int.parse(widget.image) >= 22
              ? Image.asset('assets/tarot_cards/${widget.image}.png',
                  fit: BoxFit.cover)
              : Image.asset('assets/tarot_cards/0.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}

//Animacion

class AnimatedCard extends ConsumerStatefulWidget {
  AnimatedCard({super.key});

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends ConsumerState<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> move;
  late Animation<double> bigger;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    rotation = Tween(begin: 0.0, end: 4.0 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)));

    move = Tween(begin: 0.0, end: -380.0).animate(controller);

    bigger = Tween(begin: 0.0, end: 1.4).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final description = ref.watch(animatedStartProvider);
    // final image = ref.watch(imageTarotStartProvider);
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        // print('bigger ${bigger.value}');
        return Transform.translate(
          offset: Offset(0, move.value),
          child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
                  opacity: opacity.value,
                  child: Transform.scale(
                      scale: bigger.value, child: const _CardImage()))),
        );
      },
    );
  }
}
