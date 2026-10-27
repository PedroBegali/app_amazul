import 'package:flutter/material.dart';
import '../models/categoria.dart';
import '../theme/app_theme.dart';

class CategoriaListItem extends StatelessWidget {
  final Categoria categoria;
  final VoidCallback onTap;

  const CategoriaListItem({
    super.key,
    required this.categoria,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.30),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: AppColors.cartaoClaro,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    categoria.iconeAsset,
                    width: 68,
                    height: 68,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoria.titulo,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textoEscuro,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        categoria.subtitulo,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textoMedio,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textoMedio,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
