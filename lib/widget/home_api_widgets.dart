import 'package:flutter/material.dart';

class HomeApiMessage extends StatelessWidget {
  final String mensagem;
  final VoidCallback? onRetry;

  const HomeApiMessage({super.key, required this.mensagem, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            mensagem,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70),
          ),
          if (onRetry != null)
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Tentar novamente'),
            ),
        ],
      ),
    );
  }
}

class HomePosterCard extends StatelessWidget {
  final String titulo;
  final String? imagem;
  final String detalhe;
  final bool imagemLocal;

  const HomePosterCard({
    super.key,
    required this.titulo,
    required this.imagem,
    required this.detalhe,
    this.imagemLocal = false,
  });

  Widget _placeholder() => const ColoredBox(
    color: Color(0xFF241633),
    child: Center(
      child: Icon(Icons.movie_outlined, color: Color(0xFFC084FC), size: 40),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final imagePath = imagem;
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 150,
              height: 200,
              child: imagePath == null || imagePath.isEmpty
                  ? _placeholder()
                  : imagemLocal
                  ? Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (_, error, stack) => _placeholder(),
                    )
                  : Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (_, error, stack) => _placeholder(),
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            titulo,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            detalhe,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
