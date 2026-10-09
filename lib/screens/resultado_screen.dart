import 'package:flutter/material.dart';

import '../models/compra_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';

class ResultadoScreen extends StatelessWidget {
  const ResultadoScreen({super.key, required this.compra});

  final CompraModel compra;

  String _moneda(double valor) => '\$${valor.toStringAsFixed(2)}';

  String _cantidad(double valor) =>
      valor == valor.truncateToDouble() ? valor.toInt().toString() : '$valor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de compra'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            Text(
              compra.nombreProducto,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF183B35),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Detalle de los valores calculados',
              style: TextStyle(color: Color(0xFF65736F)),
            ),
            const SizedBox(height: 24),
            CustomContainer(
              child: Column(
                children: [
                  _FilaResultado(
                    etiqueta: 'Precio unitario',
                    valor: _moneda(compra.precioUnitario),
                  ),
                  _FilaResultado(
                    etiqueta: 'Cantidad',
                    valor: _cantidad(compra.cantidad),
                  ),
                  const Divider(height: 28),
                  _FilaResultado(
                    etiqueta: 'Subtotal',
                    valor: _moneda(compra.subtotal),
                  ),
                  _FilaResultado(
                    etiqueta:
                        'Descuento (${_cantidad(compra.porcentajeDescuento)}%)',
                    valor: '- ${_moneda(compra.valorDescuento)}',
                    color: const Color(0xFF167D72),
                  ),
                  const Divider(height: 28),
                  _FilaResultado(
                    etiqueta: 'Total a pagar',
                    valor: _moneda(compra.total),
                    destacado: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: 'Volver al registro',
              icon: Icons.arrow_back_rounded,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilaResultado extends StatelessWidget {
  const _FilaResultado({
    required this.etiqueta,
    required this.valor,
    this.destacado = false,
    this.color,
  });

  final String etiqueta;
  final String valor;
  final bool destacado;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final estilo = destacado
        ? Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
          )
        : Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(etiqueta, style: estilo)),
          const SizedBox(width: 12),
          Text(
            valor,
            style: estilo?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}