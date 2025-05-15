import 'dart:io';
import 'dart:math';

void main() {
  List<Map<String, dynamic>> products = [];
  bool condicion = true;
  while (condicion) {
    print(
      "Ingrese una opcion: \n1. Agregar Producto \n2. Listar Productos \n3. Actualizar Productos \n4. Eliminar Producto \n5. Salir",
    );
    int opc = int.parse(stdin.readLineSync()!);
    switch (opc) {
      case 1:
        AgregarProductos(products);
        break;

      case 2:
        ListarProductos(products);
        break;

      case 3:
        ActualizarProductos(products);
        break;

      case 4:
      EliminarProductos(products);
        break;

      case 5:
        print("Saliendo...");
        condicion = false;
        break;

      /*  default:
        print("Opcion invalida");
        break; */
    }
  }
}

void AgregarProductos(List<Map<String, dynamic>> products) {
  print("Ingrese el nombre del producto: ");
  String? nombre = stdin.readLineSync();
  print("Ingrese el precio del producto: ");
  double? precio = double.tryParse(stdin.readLineSync() ?? '');
  print("Ingrese la cantidad del producto: ");
  int? cantidad = int.tryParse(stdin.readLineSync() ?? '');

  if (nombre != null && precio != null && precio > 0 && cantidad != null && cantidad > 0) {
    products.add({'nombre': nombre, 'precio': precio, 'cantidad': cantidad});
    print("Producto agregado correctamente");
  } else {
    print("Datos invalidos");
  }
}

void ListarProductos(List<Map<String, dynamic>> products) {
  print("Lista de Productos");
  if (products.isEmpty) {
    print("No hay productos para mostrar.");
  } else {
    print(products);
  }
}

void ActualizarProductos(List<Map<String, dynamic>> products) {
  if (products.isEmpty) {
    print("No hay productos");
  } else {
    print("Ingrese el numero del producto a actulizar: ");
    int? index = int.tryParse(stdin.readLineSync() ?? '');

    if (index != null && index >= 0 && index < products.length) {
      bool actualizando = true;
      while (actualizando) {
        print(
          "¿Que deseas actualizar?: \n1. Nombre \n2. Precio \n3. Cantidad \n4. Todos los datos \n5. No actualizar"
        );
        int opc2 = int.parse(stdin.readLineSync()!);
        switch (opc2) {
          case 1:
            print("Nuevo nombre: ");
            String? nuevoNombre = stdin.readLineSync();
            if (nuevoNombre != null) {
              products[index]["nombre"] = nuevoNombre;
              print("Nombre Actualizado");
            } else {
              print("Nombre invalido");
            }
            break;

          case 2:
            print("Nuevo precio: ");
            double? nuevoPrecio = double.tryParse(stdin.readLineSync() ?? '');
            if (nuevoPrecio != null && nuevoPrecio > 0) {
              products[index]["precio"] = nuevoPrecio;
              print("Precio Actualizado");
            } else {
              print("Precio invalido");
            }
            break;

          case 3:
            print("Nueva cantidad: ");
            int? nuevaCantidad = int.tryParse(stdin.readLineSync() ?? '');
            if (nuevaCantidad != null && nuevaCantidad > 0) {
              products[index]["cantidad"] = nuevaCantidad;
              print("Cantidad Actualizada");
            } else {
              print("Cantidad invalida");
            }
            break;

          case 4:
            print("Nuevo nombre: ");
            String? nuevoNombre = stdin.readLineSync();
            print("Nuevo precio: ");
            double? nuevoPrecio = double.tryParse(stdin.readLineSync() ?? '');
            print("Nueva cantidad: ");
            int? nuevaCantidad = int.tryParse(stdin.readLineSync() ?? '');

            if (nuevoNombre != null &&
                nuevoPrecio != null &&
                nuevaCantidad != null) {
              products[index] = {
                'nombre': nuevoNombre,
                'precio': nuevoPrecio,
                'cantidad': nuevaCantidad,
              };
              print("Producto actualizado correctamente");
            } else {
              print("Datos invalidos");
            }
            break;

          case 5:
          actualizando = false;
          break;
        }
      }
    } else {
      print("Numero de producto invalido");
    }
  }
}

void EliminarProductos(List<Map<String, dynamic>> products) {
  if (products.isEmpty) {
    print("No hay productos");
  } else {
    print("Ingrese el numero del producto a eliminar: ");
    int? index = int.tryParse(stdin.readLineSync() ?? '');

    if (index != null && index >= 0 && index < products.length) {
      products.removeAt(index);
      print("Producto eliminado correctamente");
    }else{
      print("Numero de producto invalido");
    }
  }
}
