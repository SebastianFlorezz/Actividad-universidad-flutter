# Compra Clara

Aplicación Flutter para registrar un producto y calcular el subtotal, el descuento y el total a pagar.

## Ejecutar en Android

Requisitos: Flutter instalado y un dispositivo Android o emulador configurado con Android SDK.

Desde la raíz del proyecto:

```sh
flutter pub get
flutter run
```

Para generar un APK de depuración instalable:

```sh
flutter build apk --debug
```

## Organización

- `lib/main.dart`: inicia Flutter, configura `MaterialApp` y define el tema.
- `lib/screens/registro_compra_screen.dart`: captura los datos, valida el formulario y navega al resultado.
- `lib/screens/resultado_screen.dart`: presenta el detalle de la compra y permite regresar.
- `lib/models/compra_model.dart`: contiene los datos de entrada y los importes calculados.
- `lib/services/compra_service.dart`: realiza los cálculos del negocio, separado de la interfaz.
- `lib/widgets/`: contiene `CustomTextField`, `CustomContainer` y `CustomButton` reutilizables.
- `test/widget_test.dart`: verifica validaciones, cálculo y navegación entre pantallas.

Fórmulas aplicadas:

```text
Subtotal = precio unitario x cantidad
Descuento = subtotal x porcentaje de descuento / 100
Total = subtotal - descuento
```

El precio debe ser mayor que cero, la cantidad mayor que cero y el descuento debe estar entre 0 y 100. Se aceptan decimales con punto o coma.

## Guion breve para la demo

- **¿Qué función cumple `main.dart`?** Es el punto de entrada: ejecuta la aplicación, configura `MaterialApp`, el tema y la pantalla inicial.
- **¿Qué función cumple un widget personalizado?** Encapsula una pieza visual reutilizable con una apariencia y comportamiento consistentes. Aquí se usan campos, contenedor y botón propios.
- **¿Por qué se creó `compra_service.dart`?** Para concentrar el cálculo de subtotal, descuento y total fuera de las pantallas, separando lógica de negocio e interfaz.
- **¿Qué información almacena `compra_model.dart`?** Nombre, precio unitario, cantidad, porcentaje de descuento, subtotal, valor descontado y total.
- **¿Qué función cumple `Navigator`?** Añade la pantalla de resultado a la navegación para mostrar el resumen; `pop()` vuelve al formulario.
- **¿Por qué se utiliza `dispose()`?** Libera los `TextEditingController` cuando se destruye la pantalla y evita mantener recursos innecesarios.
