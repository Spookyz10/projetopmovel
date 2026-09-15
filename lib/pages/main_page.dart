import 'package:flutter/material.dart';
import 'package:project_c/api/fake_api_home.dart';
import 'package:project_c/api/tvmaze_api.dart';
import 'package:project_c/domain/recomendacao_home.dart';
import 'package:project_c/domain/serie.dart';
import 'package:project_c/widget/home_api_widgets.dart';
import 'package:url_launcher/link.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final TvmazeApi _seriesApi;
  late final FakeApiHome _homeApi;
  late Future<List<Serie>> _futureSeries;
  late Future<List<RecomendacaoHome>> _futureRecomendacoes;

  @override
  void initState() {
    super.initState();
    _seriesApi = TvmazeApi();
    _homeApi = FakeApiHome();
    // As consultas são criadas uma vez, fora do build.
    _futureSeries = _seriesApi.listarSeries();
    _futureRecomendacoes = _homeApi.listarRecomendacoes();
  }

  Widget _buildSeries() {
    return FutureBuilder<List<Serie>>(
      future: _futureSeries,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return HomeApiMessage(
            mensagem:
                'Não foi possível carregar as séries. Verifique sua conexão.',
            onRetry: () => setState(() {
              _futureSeries = _seriesApi.listarSeries();
            }),
          );
        }
        final series = snapshot.data ?? [];
        if (series.isEmpty) {
          return const HomeApiMessage(
            mensagem: 'Nenhuma série disponível no momento.',
          );
        }
        return _posterList(series.length, (context, index) {
          final serie = series[index];
          return HomePosterCard(
            titulo: serie.titulo,
            imagem: serie.imagem,
            detalhe: serie.nota == null
                ? 'Sem avaliação'
                : 'Nota ${serie.nota!.toStringAsFixed(1)} / 10',
          );
        });
      },
    );
  }

  Widget _buildRecomendacoes() {
    return FutureBuilder<List<RecomendacaoHome>>(
      future: _futureRecomendacoes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return HomeApiMessage(
            mensagem: 'Não foi possível carregar as escolhas da semana.',
            onRetry: () => setState(() {
              _futureRecomendacoes = _homeApi.listarRecomendacoes();
            }),
          );
        }
        final recomendacoes = snapshot.data ?? [];
        if (recomendacoes.isEmpty) {
          return const HomeApiMessage(
            mensagem: 'Nenhuma recomendação disponível no momento.',
          );
        }
        return _posterList(recomendacoes.length, (context, index) {
          final filme = recomendacoes[index];
          return HomePosterCard(
            titulo: filme.titulo,
            imagem: filme.imagem,
            detalhe: filme.descricao,
            imagemLocal: true,
          );
        });
      },
    );
  }

  Widget _posterList(int count, IndexedWidgetBuilder builder) {
    return SizedBox(
      height: 210 + 88 * MediaQuery.textScalerOf(context).scale(1),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: count,
        separatorBuilder: (_, index) => const SizedBox(width: 16),
        itemBuilder: builder,
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E10),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/CidadeDeDeus.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 350,
                  ),
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xFF120A1D)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 300,
                    child: Text(
                      "Cidade de Deus",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
              _sectionTitle('Escolhas da semana'),
              _buildRecomendacoes(),
              _sectionTitle('Séries para descobrir'),
              _buildSeries(),
              Link(
                uri: Uri.parse('https://www.tvmaze.com/'),
                target: LinkTarget.blank,
                builder: (context, followLink) => TextButton(
                  onPressed: followLink,
                  child: const Text('Dados das séries: TVmaze · CC BY-SA'),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/CidadeDeDeus.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    SizedBox(width: 23),
                    Image.asset(
                      'assets/OAutoDaCompadecida.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    SizedBox(width: 23),
                    Image.asset(
                      'assets/OLoboAtrasDaPorta.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ação",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/TropaDeElite.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    SizedBox(width: 23),
                    Image.asset(
                      'assets/OCangaceiro.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    SizedBox(width: 23),
                    Image.asset(
                      'assets/OInvasor.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Comedia",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/AMulherDeTodos.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    SizedBox(width: 23),
                    Image.asset(
                      'assets/OPalhaco.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    SizedBox(width: 23),
                    Image.asset(
                      'assets/ByeByeBrasil.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Romance",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/CentralDoBrasil.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    SizedBox(width: 23),
                    Image.asset(
                      'assets/AbrilDespedacado.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                    SizedBox(width: 23),
                    Image.asset(
                      'assets/AHoraDaEstrela.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
