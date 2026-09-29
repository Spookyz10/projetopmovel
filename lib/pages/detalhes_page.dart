import 'package:flutter/material.dart';
import 'package:project_c/db/assistir_mais_tarde_dao.dart';
import 'package:project_c/db/propriedade_dao.dart';
import 'package:project_c/domain/assistir_mais_tarde.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({super.key});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  static const _movieTitle = 'O Auto da Compadecida';
  static const _movie = _StaticMovie(
    title: _movieTitle,
    overview:
        'João Grilo e Chicó, dois nordestinos pobres e astutos, enfrentam '
        'os poderosos de uma pequena cidade do sertão. Com humor e esperteza, '
        'suas aventuras misturam crítica social, amizade e elementos da cultura popular brasileira.',
    year: '2000',
    runtime: '1h 44min',
    genres: ['Comédia', 'Aventura', 'Drama'],
    cast: ['Matheus Nachtergaele', 'Selton Mello', 'Fernanda Montenegro'],
  );
  final AssistirMaisTardeDao _watchLaterDao = AssistirMaisTardeDao();
  final PropriedadeDao _propertyDao = PropriedadeDao();
  bool _watchLater = false;
  bool _favorite = false;

  @override
  void initState() {
    super.initState();
    _loadLocalState();
  }

  Future<void> _loadLocalState() async {
    try {
      final items = await _watchLaterDao.listarAssistirMaisTarde();
      final properties = await _propertyDao.listarPropriedades();
      if (!mounted) return;
      setState(() {
        _watchLater = items.any((item) => item.titulo == _movieTitle);
        for (final property in properties) {
          if (property.filme == _movieTitle) {
            _favorite = property.favorito == 1;
            break;
          }
        }
      });
    } catch (_) {}
  }

  Future<void> _toggleWatchLater() async {
    if (_watchLater) {
      await _watchLaterDao.removerAssistirMaisTarde(_movieTitle);
    } else {
      await _watchLaterDao.inserirAssistirMaisTarde(
        AssistirMaisTarde(titulo: _movieTitle),
      );
    }
    if (mounted) setState(() => _watchLater = !_watchLater);
  }

  Future<void> _toggleFavorite() async {
    await _propertyDao.toggleFavorito(_movieTitle, _favorite ? 0 : 1);
    if (mounted) setState(() => _favorite = !_favorite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E0E10),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Detalhes da minissérie',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _MovieView(
        movie: _movie,
        favorite: _favorite,
        watchLater: _watchLater,
        onToggleFavorite: _toggleFavorite,
        onToggleWatchLater: _toggleWatchLater,
      ),
    );
  }
}

class _StaticMovie {
  final String title;
  final String overview;
  final String year;
  final String runtime;
  final List<String> genres;
  final List<String> cast;

  const _StaticMovie({
    required this.title,
    required this.overview,
    required this.year,
    required this.runtime,
    required this.genres,
    required this.cast,
  });
}

class _MovieView extends StatelessWidget {
  final _StaticMovie movie;
  final bool favorite;
  final bool watchLater;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleWatchLater;

  const _MovieView({
    required this.movie,
    required this.favorite,
    required this.watchLater,
    required this.onToggleFavorite,
    required this.onToggleWatchLater,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 350,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/OAutoDaCompadecida.png',
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const ColoredBox(
                  color: Color(0xFF21152E),
                  child: Center(
                    child: Icon(Icons.movie_rounded, color: Colors.white54, size: 72),
                  ),
                ),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xFF0E0E10)],
                    stops: [0.25, 1],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: movie.genres
                          .map((genre) => _GenreChip(label: genre))
                          .toList(),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _InfoChip(
                    icon: Icons.schedule_rounded,
                    label: movie.runtime,
                  ),
                  _InfoChip(icon: Icons.calendar_month, label: movie.year),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Assistir agora'),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF7C3AED),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  _ActionButton(
                    selected: favorite,
                    icon: favorite ? Icons.favorite : Icons.favorite_border,
                    tooltip: 'Favorito',
                    onPressed: onToggleFavorite,
                  ),
                  const SizedBox(width: 8),
                  _ActionButton(
                    selected: watchLater,
                    icon: watchLater ? Icons.bookmark : Icons.bookmark_border,
                    tooltip: 'Assistir mais tarde',
                    onPressed: onToggleWatchLater,
                  ),
                ],
              ),
              const SizedBox(height: 26),
              const _SectionTitle('Sinopse'),
              const SizedBox(height: 8),
              Text(
                movie.overview.isEmpty
                    ? 'Sinopse não disponível.'
                    : movie.overview,
                style: const TextStyle(
                  color: Colors.white70,
                  height: 1.5,
                  fontSize: 14,
                ),
              ),
              if (movie.cast.isNotEmpty) ...[
                const SizedBox(height: 24),
                const _SectionTitle('Elenco principal'),
                const SizedBox(height: 8),
                Text(
                  movie.cast.join(' • '),
                  style: const TextStyle(color: Colors.white70, height: 1.5),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String label;
  const _GenreChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xDD1A1026),
        border: Border.all(color: const Color(0xFF8B5CF6)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          color: Color(0xFFC4B5FD),
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFF21152E),
        border: Border.all(color: const Color(0xFF5B21B6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFC084FC), size: 18),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFE9D5FF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  const _ActionButton({
    required this.selected,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        foregroundColor: selected ? const Color(0xFFF472B6) : Colors.white,
        backgroundColor: const Color(0xFF21152E),
        minimumSize: const Size(52, 52),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Color(0xFFC4B5FD),
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }
}
