class CompraModel {
  const CompraModel({
    required this.nombreProducto,
    required this.precioUnitario,
    required this.cantidad,
    required this.porcentajeDescuento,
    required this.subtotal,
    required this.valorDescuento,
    required this.total,
  });

  final String nombreProducto;
  final double precioUnitario;
  final double cantidad;
  final double porcentajeDescuento;
  final double subtotal;
  final double valorDescuento;
  final double total;
}