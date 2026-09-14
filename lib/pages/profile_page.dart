import 'package:flutter/material.dart';
import 'package:project_c/api/profile_api.dart';
import 'package:project_c/db/configuracao_dao.dart';
import 'package:project_c/db/propriedade_dao.dart';
import 'package:project_c/domain/propriedade.dart';
import 'package:project_c/domain/user_profile.dart';
import 'package:project_c/widget/container_perfil.dart';

class ProfilePage extends StatefulWidget {
  final ProfileApi? api;

  const ProfilePage({super.key, this.api});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileApi _profileApi;
  final ConfiguracaoDao _configDao = ConfiguracaoDao();
  final PropriedadeDao _propertyDao = PropriedadeDao();
  late Future<UserProfile> _profileFuture;
  bool _fullScreen = false;
  bool _notifications = false;
  List<Propriedade> _favorites = [];

  @override
  void initState() {
    super.initState();
    _profileApi = widget.api ?? ProfileApi();
    _profileFuture = _profileApi.getProfile();
    _loadLocalData();
  }

  Future<void> _loadLocalData() async {
    try {
      final values = await Future.wait<dynamic>([
        _configDao.getValor('full_screen'),
        _configDao.getValor('notificacoes'),
        _propertyDao.listarFavoritos(),
      ]);
      if (!mounted) return;
      setState(() {
        _fullScreen = values[0] as bool;
        _notifications = values[1] as bool;
        _favorites = values[2] as List<Propriedade>;
      });
    } catch (_) {
      // O perfil remoto continua visível caso o banco local falhe.
    }
  }

  void _reload() {
    setState(() => _profileFuture = _profileApi.getProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0614),
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color(0xFF0D0614),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<UserProfile>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const _ProfileLoading();
          }
          if (snapshot.hasError) {
            return _ProfileError(error: snapshot.error, onRetry: _reload);
          }
          return _buildProfile(snapshot.requireData);
        },
      ),
    );
  }

  Widget _buildProfile(UserProfile profile) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 36),
      children: [
        _ProfileHeader(profile: profile),
        const SizedBox(height: 18),
        _StatsCard(profile: profile),
        const SizedBox(height: 24),
        const _SectionTitle('Gêneros favoritos'),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: profile.favoriteGenres
              .map(
                (genre) => Chip(
                  label: Text(genre),
                  labelStyle: const TextStyle(color: Color(0xFFE9D5FF)),
                  backgroundColor: const Color(0xFF21152E),
                  side: const BorderSide(color: Color(0xFF5B21B6)),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 24),
        const _SectionTitle('Preferências'),
        const SizedBox(height: 10),
        Container(
          decoration: _panelDecoration,
          child: Column(
            children: [
              _PreferenceItem(
                icon: Icons.fullscreen_rounded,
                title: 'Tela cheia',
                description:
                    'Oculta as barras do sistema durante a reprodução.',
                value: _fullScreen,
                onChanged: (value) async {
                  await _configDao.salvarValor('full_screen', value);
                  if (mounted) setState(() => _fullScreen = value);
                },
              ),
              const Divider(height: 1, color: Color(0xFF3E1A63)),
              _PreferenceItem(
                icon: Icons.notifications_outlined,
                title: 'Notificações',
                description: 'Receba novidades e novas recomendações.',
                value: _notifications,
                onChanged: (value) async {
                  await _configDao.salvarValor('notificacoes', value);
                  if (mounted) setState(() => _notifications = value);
                },
              ),
            ],
          ),
        ),
        if (profile.recentReviews.isNotEmpty) ...[
          const SizedBox(height: 24),
          const _SectionTitle('Avaliações recentes'),
          const SizedBox(height: 10),
          ...profile.recentReviews.map(_ReviewCard.new),
        ],
        const SizedBox(height: 24),
        const _SectionTitle('Favoritos salvos no aparelho'),
        const SizedBox(height: 10),
        if (_favorites.isEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: _panelDecoration,
            child: const Text(
              'Nenhum favorito salvo neste aparelho.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54),
            ),
          )
        else
          ..._favorites.map(
            (favorite) => ContainerPerfil(propriedade: favorite),
          ),
        const SizedBox(height: 24),
        const Center(
          child: Text(
            'Perfil carregado pela API Fake',
            style: TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

const _panelDecoration = BoxDecoration(
  color: Color(0xFF17101F),
  border: Border.fromBorderSide(BorderSide(color: Color(0xFF4C1D78))),
  borderRadius: BorderRadius.all(Radius.circular(18)),
);

class _ProfileHeader extends StatelessWidget {
  final UserProfile profile;
  const _ProfileHeader({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 104,
          height: 104,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
            ),
          ),
          child: ClipOval(
            child: profile.avatarUrl.isEmpty
                ? const _AvatarFallback()
                : Image.network(
                    profile.avatarUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => const _AvatarFallback(),
                  ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          profile.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          profile.username,
          style: const TextStyle(color: Color(0xFFC4B5FD)),
        ),
        const SizedBox(height: 10),
        Text(
          profile.bio,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, height: 1.4),
        ),
        const SizedBox(height: 6),
        Text(
          'Membro desde ${profile.memberSince}',
          style: const TextStyle(color: Colors.white38, fontSize: 12),
        ),
      ],
    );
  }
}

class _AvatarFallback extends StatelessWidget {
  const _AvatarFallback();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xFF21152E),
      child: Icon(Icons.person, color: Colors.white, size: 54),
    );
  }
}

class _StatsCard extends StatelessWidget {
  final UserProfile profile;
  const _StatsCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: _panelDecoration,
      child: Row(
        children: [
          _Stat(value: profile.watchedMovies, label: 'Assistidos'),
          const _StatDivider(),
          _Stat(value: profile.favoritesCount, label: 'Favoritos'),
          const _StatDivider(),
          _Stat(value: profile.reviewsCount, label: 'Avaliações'),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final int value;
  final String label;
  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '$value',
            style: const TextStyle(
              color: Color(0xFFC084FC),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 36,
      child: VerticalDivider(color: Color(0xFF4C1D78)),
    );
  }
}

class _PreferenceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _PreferenceItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFC084FC)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final UserReview review;
  const _ReviewCard(this.review);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: _panelDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  review.movieTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFFACC15),
                size: 18,
              ),
              const SizedBox(width: 3),
              Text(
                review.rating.toStringAsFixed(1),
                style: const TextStyle(color: Color(0xFFFACC15)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(review.comment, style: const TextStyle(color: Colors.white60)),
        ],
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
        letterSpacing: 1.1,
      ),
    );
  }
}

class _ProfileLoading extends StatelessWidget {
  const _ProfileLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: Color(0xFF8B5CF6)),
          SizedBox(height: 16),
          Text(
            'Carregando perfil da API Fake…',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _ProfileError extends StatelessWidget {
  final Object? error;
  final VoidCallback onRetry;
  const _ProfileError({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_off_outlined,
              color: Color(0xFFC084FC),
              size: 64,
            ),
            const SizedBox(height: 18),
            const Text(
              'Perfil indisponível',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              error.toString().replaceFirst('Exception: ', ''),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white60, height: 1.4),
            ),
            const SizedBox(height: 22),
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Tentar novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
