import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horoscope_app/db/entities/horoscope_entity.dart';
import 'package:horoscope_app/providers/providers.dart';

class HoroscopeScreen extends ConsumerStatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  HoroscopeScreenState createState() => HoroscopeScreenState();
}

class HoroscopeScreenState extends ConsumerState<HoroscopeScreen> {
  String mySign = 'aries';
  @override
  Widget build(BuildContext context) {
    final horoscope = ref.watch(dayliHoroscopeProvider(mySign));

    return Scaffold(
        appBar: AppBar(
          title: const Text('tu horoscopo'),
        ),
        body: Column(
          children: [
            horoscope.when(
              data: (data) => Column(
                children: [Text(data.date), Text(data.horoscopeData)],
              ),
              loading: () => const CircularProgressIndicator(),
              error: (Object error, StackTrace stackTrace) => Text('$error'),
            ),
            // TextFormField(
            //   onTap:,

            // )
          ],
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () => context.push('/oracle')));
  }
}
