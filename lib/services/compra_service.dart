import '../models/compra_model.dart';

class CompraService {
  const CompraService();

  CompraModel calcularCompra({
    required String nombreProducto,
    required double precioUnitario,
    required double cantidad,
    required double porcentajeDescuento,
  }) {
    final subtotal = precioUnitario * cantidad;
    final valorDescuento = subtotal * porcentajeDescuento / 100;

    return CompraModel(
      nombreProducto: nombreProducto,
      precioUnitario: precioUnitario,
      cantidad: cantidad,
      porcentajeDescuento: porcentajeDescuento,
      subtotal: subtotal,
      valorDescuento: valorDescuento,
      total: subtotal - valorDescuento,
    );
  }
}