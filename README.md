# LisTar - Aplicación de Gestión de Tareas

## Descripción General
LisTar es una aplicación de gestión de tareas desarrollada con Flutter que permite a los usuarios administrar sus tareas de manera eficiente, con una interfaz moderna y un backend robusto.

## Características
- Agregar nuevas tareas
- Eliminar tareas existentes
- Marcar tareas como completadas
- Filtrar tareas por estado (pendientes/completadas)
- Almacenamiento de datos persistente

## Snapshots
<img width="200" height=“400” src="snapshots/snapshot_1.gif"></img>
<img width="200" height=“400” src="snapshots/snapshot_2.gif"></img>
<img width="200" height=“400” src="snapshots/snapshot_3.gif"></img>
<img width="200" height=“500” src="snapshots/snapshot_4.gif"></img>

## Tecnologías Utilizadas
- **Flutter**: Framework de desarrollo móvil multiplataforma
- **Riverpod**: Solución de gestión de estado
- **SQFlite**: Base de datos local para persistencia de datos
- **Arquitectura Limpia**: Estructura de código modular y mantenible

## Descargar APK
### Opción 1: Descargar Directamente
Puedes descargar el APK directamente desde el directorio de APK en el repositorio:
[Descargar APK](https://github.com/Blackspyda17/listar/raw/main/apk/listar.apk)

### Opción 2: Generar APK desde el Código Fuente
Si prefieres generar el APK tú mismo:

```bash
flutter build apk --release
```

## Requisitos Previos
- SDK de Flutter (última versión estable)
- Android Studio o VS Code
- Dispositivo Android o emulador

## Comenzando

### Instalación
1. Clonar el repositorio:
```bash
git clone https://github.com/Blackspyda17/listar.git
cd listar
```

2. Instalar dependencias:
```bash
flutter pub get
```

### Ejecutar la Aplicación
```bash
flutter run
```

### Generar APK
```bash
flutter build apk
```

## Estructura del Proyecto
```
lib/
├── app/            # Configuración principal de la aplicación
├── config/         # Configuraciones generales y constantes
├── data/           # Capa de datos (repositorios, modelos, fuentes de datos)
├── providers/      # Proveedores de estado con Riverpod
├── screens/        # Pantallas de la aplicación
├── utils/          # Utilidades y funciones auxiliares
├── widgets/        # Widgets reutilizables personalizados
└── main.dart       # Punto de entrada de la aplicación
```

## Gestión de Estado
La aplicación utiliza Riverpod para una gestión de estado eficiente y predecible, asegurando una separación clara de responsabilidades.

## Persistencia Local
SQFlite se utiliza para almacenar tareas localmente, permitiendo que los datos persistan entre sesiones de la aplicación.

## Mejoras Futuras
- Añadir funcionalidad de edición de tareas
- Implementar categorías de tareas
- Crear opciones de filtrado más avanzadas
- Agregar pruebas unitarias y de widgets

## Contribución
1. Hacer un fork del repositorio
2. Crear una rama de características (`git checkout -b caracteristica/FantasticaCaracteristica`)
3. Confirmar los cambios (`git commit -m 'Agregar alguna FantasticaCaracteristica'`)
4. Subir la rama (`git push origin caracteristica/FantasticaCaracteristica`)
5. Abrir una Solicitud de Extracción

## Licencia
Distribuido bajo la Apache 2.0. Consulte `LICENSE` para más información.

## Contacto
Gilberth Paez Ortiz - paez1702@gmail.com

Enlace del Proyecto: [https://github.com/Blackspyda17/listar](https://github.com/Blackspyda17/listar)
