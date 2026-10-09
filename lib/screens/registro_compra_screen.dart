import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/compra_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_text_field.dart';
import 'resultado_screen.dart';

class RegistroCompraScreen extends StatefulWidget {
  const RegistroCompraScreen({super.key});

  @override
  State<RegistroCompraScreen> createState() => _RegistroCompraScreenState();
}

class _RegistroCompraScreenState extends State<RegistroCompraScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _descuentoController = TextEditingController(text: '0');
  final _compraService = const CompraService();

  @override
  void dispose() {
    _nombreController.dispose();
    _precioController.dispose();
    _cantidadController.dispose();
    _descuentoController.dispose();
    super.dispose();
  }

  String? _validarTexto(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  String? _validarNumero(String? value, {required String campo}) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingresa $campo';
    }
    final numero = double.tryParse(value.trim().replaceAll(',', '.'));
    if (numero == null || !numero.isFinite) {
      return 'Ingresa un valor numérico válido';
    }
    if (campo == 'el precio' && numero <= 0) {
      return 'El precio debe ser mayor que cero';
    }
    if (campo == 'la cantidad' && numero <= 0) {
      return 'La cantidad debe ser mayor que cero';
    }
    if (campo == 'el descuento' && (numero < 0 || numero > 100)) {
      return 'Usa un porcentaje entre 0 y 100';
    }
    return null;
  }

  double _leerNumero(TextEditingController controller) =>
      double.parse(controller.text.trim().replaceAll(',', '.'));

  void _calcularCompra() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    final compra = _compraService.calcularCompra(
      nombreProducto: _nombreController.text.trim(),
      precioUnitario: _leerNumero(_precioController),
      cantidad: _leerNumero(_cantidadController),
      porcentajeDescuento: _leerNumero(_descuentoController),
    );

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ResultadoScreen(compra: compra),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compra Clara'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            children: [
              Text(
                'Calcula tu compra',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF183B35),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Ingresa los datos del producto para conocer el total.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF65736F),
                ),
              ),
              const SizedBox(height: 24),
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Datos del producto',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 18),
                    CustomTextField(
                      controller: _nombreController,
                      label: 'Nombre del producto',
                      validator: _validarTexto,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _precioController,
                      label: 'Precio unitario',
                      prefixText: '\$ ',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                      ],
                      validator: (value) =>
                          _validarNumero(value, campo: 'el precio'),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _cantidadController,
                      label: 'Cantidad',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                      ],
                      validator: (value) =>
                          _validarNumero(value, campo: 'la cantidad'),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _descuentoController,
                      label: 'Descuento',
                      prefixText: '% ',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                      ],
                      validator: (value) =>
                          _validarNumero(value, campo: 'el descuento'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: 'Calcular compra',
                icon: Icons.calculate_outlined,
                onPressed: _calcularCompra,
              ),
            ],
          ),
        ),
      ),
    );
  }
}