import 'package:flutter/material.dart';
import '../models/categoria.dart';

class CategoriaListItem extends StatelessWidget {
  final Categoria categoria;
  final VoidCallback onTap;
  final VoidCallback onFavoritar;

  const CategoriaListItem({
    super.key,
    required this.categoria,
    required this.onTap,
    required this.onFavoritar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: categoria.cor.withValues(alpha: 0.15),
          child: Icon(categoria.icone, color: categoria.cor, size: 28),
        ),
        title: Text(
          categoria.titulo,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(categoria.subtitulo),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                categoria.favorita ? Icons.star : Icons.star_border,
                color: categoria.favorita ? Colors.amber : Colors.grey,
              ),
              tooltip: 'Favoritar tema',
              onPressed: onFavoritar,
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}