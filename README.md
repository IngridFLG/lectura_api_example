
# 📱 Ejemplo de Uso del Paquete `lectura_api_package` en Flutter

Este proyecto es un ejemplo práctico que demuestra cómo utilizar el paquete `lectura_api_package` para interactuar con la Fake Store API. La aplicación permite:

- Listar productos obtenidos de la API.
- Agregar nuevos productos mediante un formulario.
- Eliminar productos existentes.

---

## 🚀 Cómo Ejecutar el Ejemplo

### 1. **Clonar el Repositorio**

Clona este repositorio en tu máquina local:

```bash
git clone https://github.com/tu-usuario/flutter-example-lectura-api.git
cd flutter-example-lectura-api
```

### 2. **Instalar las Dependencias**

Ejecuta el siguiente comando para instalar las dependencias necesarias:

```bash
flutter pub get
```

### 3. **Ejecutar la Aplicación**

Para ejecutar el ejemplo en un emulador o dispositivo físico, utiliza el comando:

```bash
flutter run
```

---

## 📂 Estructura del Proyecto

El proyecto está organizado de la siguiente manera:

```
lib/
├── main.dart                 # Punto de entrada de la aplicación.
├── screens/                  # Pantallas principales de la app.
│   ├── product_list_screen.dart # Pantalla para listar productos.
│   ├── add_product_screen.dart  # Pantalla para agregar nuevos productos.
├── widgets/                  # Widgets reutilizables.
│   └── product_card.dart        # Widget para mostrar productos individuales.
```

---

## 🛠️ Funcionalidades del Ejemplo

### 1. **Lista de Productos**

La pantalla principal muestra una lista de productos obtenidos de la Fake Store API. Cada producto incluye:

- Título.
- Precio.
- Imagen.
- Botón para eliminar el producto.

### 2. **Agregar un Producto**

Al hacer clic en el botón `+` de la pantalla principal:

- Se abre un formulario donde puedes ingresar los datos de un nuevo producto.
- Al guardar, el producto se agrega a la lista.

### 3. **Eliminar un Producto**

Cada producto en la lista tiene un botón de eliminar. Al hacer clic, el producto se elimina de manera simulada usando la API.

---

## 📑 Recursos Relacionados

- **Fake Store API:** [https://fakestoreapi.com](https://fakestoreapi.com)
- **Repositorio del Ejemplo:** [GitHub](https://github.com/IngridFLG/lectura_api_example)
- **Paquete Utilizado:** [lectura_api_package](https://github.com/IngridFLG/lectura_api_package)
