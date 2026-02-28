# Catbreeds: Ejercicio de acercamiento al rol
<p align="center">
<img width="250"  alt="cat_1" src="https://github.com/user-attachments/assets/cf8e4e92-0924-4e23-a604-07ec7edc8d0c" />
<img width="250"  alt="cat_2" src="https://github.com/user-attachments/assets/a0d7ac7b-7f56-454f-b6e6-4d8b69cb0243" />
</p>

## 🌿 Branches del proyecto

| Rama       | Descripción                                                                |
| ---------- | -------------------------------------------------------------------------- |
| `master`   | Estructura base y arquitectura inicial del proyecto.                       |
| `main`     | **Versión final entregable. Ejecutar esta rama para evaluar el proyecto.** |

## Requisitos



- Flutter 3.35.7 (recomendado con FVM)

## ⚙️ Cómo Ejecutar el Proyecto Rápidamente

Sigue estos pasos para poner en marcha el proyecto en tu entorno local:

### 📦 Instalación Rápida

1.  **Clonar el repositorio:**
    ```bash
    git clone https://github.com/abialex/pragma_acercamiento.git
    cd pragma_acercamiento
    ```
2.  **Configurar FVM e instalar dependencias:**
    ```bash
    dart pub global activate fvm
    fvm install
    fvm use 3.35.7
    fvm flutter pub get
    ```
3.  **Generar archivos Freezed y JSON Serializable:**
    Este paso es crucial para los modelos de datos y los Blocs.
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
4.  **Configurar variables de entorno:**
    Crea un archivo `.env` en la carpeta `assets/env/` con tu `API_KEY` para TheCatAPI.
    ```
    API_KEY=live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr
    ```
5.  **Ejecutar la aplicación con un Flavor específico:**
    El proyecto está configurado con tres _flavors_: `development`, `staging` y `production`, que utilizan diferentes puntos de entrada (`main_development.dart`, `main_staging.dart`, `main_production.dart`).

    Para ejecutar en `development`:

    ```bash
    flutter run --flavor dev --target lib/main_dev.dart
    ```

    Para ejecutar en `staging`:

    ```bash
    flutter run --flavor uat --target lib/main_uat.dart
    ```

    Para ejecutar en `production`:

    ```bash
    flutter run --flavor prod --target lib/main_prod.dart
    ```


## 🎯 Visión General

Pragma Acercamiento es una aplicación Flutter estructurada como un **monorepo modular** con packages personalizados creados por ti. El proyecto aprovecha un sistema de packages locales reutilizables sin depender de herramientas como Melos. La arquitectura sigue los principios de **Clean Architecture** con soporte para múltiples sabores (flavors) de compilación.

### Características Principales

- ✅ **Arquitectura Limpia** - Separación clara entre data, domain y presentation
- 🎨 **Design System Personalizado** - UI Kit propio con componentes reutilizables
- 🗺️ **Enrutamiento Modular** - GoRouter encapsulado en package personalizado
- 💾 **Almacenamiento Local Personalizado** - Abstracción con ObjectBox
- 🌐 **Gestor de Red Personalizado** - Dio con logging estructurado
- 📦 **Monorepo sin Melos** - Múltiples packages locales coordinados sin dependencias externas
- 📚 **Widgetbook** - Catálogo interactivo de componentes del UI Kit

## 📁 Estructura del Proyecto

```
pragma_acercamiento/
├── lib/                          # Aplicación principal
│   ├── main.dart                # Entry point
│   ├── main_dev.dart            # Flavor: Development
│   ├── main_uat.dart            # Flavor: UAT
│   ├── main_prod.dart           # Flavor: Production
│   ├── config/                  # Configuración global
│   ├── core/                    # Utilidades centrales
│   │   ├── di/                 # Inyección de dependencias
│   │   ├── error/              # Manejo de errores
│   │   └── routes/             # Definición de rutas
│   ├── data/                    # Capa de datos
│   │   ├── datasources/        # Fuentes de datos
│   │   ├── models/             # Modelos de datos
│   │   └── repositories/       # Implementación de repositorios
│   ├── domain/                  # Capa de lógica de negocios
│   │   ├── entities/           # Entidades de dominio
│   │   ├── repositories/       # Interfaces de repositorios

│   ├── presentation/            # Capa de presentación
│   │   ├── pages/              # Páginas/Pantallas
│   │   ├── widgets/            # Widgets personalizados
│   │   ├── bloc/               # BLoC para lógica de UI

│   └── flavors/                # Configuración de sabores
│
├── packages/                    # Packages personalizados del monorepo
│   ├── ui_kit/                 # Design System y componentes creados a medida
│   ├── router_core/            # Enrutamiento personalizado
│   ├── network_manager/        # Gestor de red personalizado
│   └── local_storage_manager/  # Almacenamiento local personalizado
│
├── widgetbook_app/             # Catálogo interactivo de componentes
│   ├── lib/
│   └── pubspec.yaml
│
├── test/                        # Tests unitarios e integración

│
├── pubspec.yaml                # Dependencias principales
├── analysis_options.yaml       # Reglas de linting
└── build.yaml                  # Configuración de generadores
```

### Testing
Coverage
<p align="center">
<img width="600" height="200" alt="Code_7moJ3pbgDQ" src="https://github.com/user-attachments/assets/f28d5821-c2ee-4441-986a-dc63dfca2e96" />
</p>

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests con coverage
flutter test --coverage

# Tests en un archivo específico
flutter test test/domain/usecases/user_usecase_test.dart

# Tests con patrones
flutter test --name="LoginBloc"
```
## 📦 Packages Personalizados del Monorepo

Los siguientes packages fueron creados específicamente para este proyecto como parte del monorepo. Son componentes reutilizables que encapsulan funcionalidad clave de la aplicación sin depender de herramientas como Melos.

| Package | Descripción | Características |
|---------|-------------|-----------------|
| **ui_kit** | Design System y componentes reutilizables creados a medida | • Componentes atómicos reutilizables<br>• Sistema de temas personalizados<br>• Tipografía: Basic Sans y Neue Haas Unica<br>• Soporte assets, network<br>`import 'package:ui_kit/ui_kit.dart';` |
| **router_core** | Infraestructura de enrutamiento personalizada | • Integración con GoRouter<br>• Definición centralizada de rutas<br>• Soporte para rutas anidadas<br>`import 'package:router_core/router_core.dart';` |
| **network_manager** | Gestión de peticiones HTTP personalizada | • Cliente HTTP con Dio<br>• Logging automático<br>• Manejo centralizado de errores<br>• Interceptores configurables<br>• Talker para debugging<br>`import 'package:network_manager/network_manager.dart';` |
| **local_storage_manager** | Almacenamiento local personalizado | • Abstracción de persistencia<br>• ObjectBox como motor de BD<br>• Modelos Genéricos<br>• Queryable y performante<br>`import 'package:local_storage_manager/local_storage_manager.dart';` |

## 🏗️ Decisiones Técnicas Clave

### 1. Arquitectura y Manejo de Estado

- **BLoC:** Manejo de estado reactivo y desacoplado de la UI para mayor modularidad y testabilidad.
- **Freezed:** Generación de clases inmutables y union types para estados/eventos, reduciendo código repetitivo y evitando errores.
- **Inyección de Dependencias (GetIt):** Contenedor centralizado para registrar y acceder a dependencias sin acoplamientos innecesarios.

### 2. Navegación Modular

- **GoRouter:** Navegación declarativa, flexible y escalable con soporte para rutas anidadas y manejo de estados de URL.
- **router_core (Package Personalizado):** Encapsula la infraestructura de enrutamiento permitiendo reutilización entre aplicaciones del monorepo.

### 3. Gestión de Red Centralizada

- **network_manager (Package Personalizado):** Abstracción completa de Dio con interceptadores configurables.
- **Logging Estructurado:** Integración con Talker para debugging automático de requests/responses.
- **Manejo de Errores Consistente:** Mapeo centralizado de errores HTTP a entidades de dominio usando `Either<Failure, Success>` de fpdart.

### 4. Almacenamiento Local Personalizado

- **ObjectBox:** Base de datos NoSQL local de alto rendimiento y bajo consumo de memoria.
- **local_storage_manager (Package Personalizado):** Abstracción que proporciona interfaces genéricas para persistencia, facilitando testing y cambios futuros.
- **Modelos Tipados:** Uso de freezed para modelos inmutables de persistencia.

### 5.  Flavors

- **Flavors (`development`, `uat`, `production`):** La app soporta múltiples entornos de construcción para gestionar diferentes APIs, configuraciones y comportamientos.
- **Puntos de Entrada Separados:** Cada flavor cuenta con su propio archivo `main_*.dart` (`main_dev.dart`, `main_uat.dart`, `main_prod.dart`) para facilitar configuración específica por entorno.
- **AppFlavorConfig:** Clase centralizada que define URLs, endpoints y ajustes personalizados por flavor.

### 6. Design System Escalable

- **ui_kit (Package Personalizado):** Design System completo separado en su propio package, permitiendo versionamiento independiente y reutilización en múltiples aplicaciones.
- **Componentes Atómicos:** Estructura de componentes pequeños y componibles que siguen principios de atomic design.
- **Temas Personalizables:** Sistema de temas que permite cambios dinámicos sin reconstruir la app.

### 7. Monorepo sin Herramientas Externas

- **Packages Locales:** Todas las funcionalidades clave están organizadas en packages locales que se importan directamente via `path` en pubspec.yaml.
- **Sin Melos:** El proyecto evita dependencias de herramientas como Melos, manteniendo la configuración simple y el flujo de trabajo directo.
- **Independencia de Desarrollo:** Cada package puede desarrollarse, testearse y versionarse de forma independiente dentro del mismo repositorio.

## 📚 Widgetbook

La aplicación incluye **Widgetbook**, un catálogo interactivo de componentes del UI Kit.

### Ejecutar Widgetbook

```bash
cd widgetbook_app
flutter run -t lib/main.dart
```

O desde la raíz:
```bash
flutter run -t widgetbook_app/lib/main.dart
```

### Características de Widgetbook

- 📖 Catálogo interactivo de componentes
- 🎨 Preview de todos los widgets del UI Kit
- 📐 Visualización de diferentes estados

### Agregar nuevos componentes a Widgetbook

1. Crear un widget en `ui_kit/lib/src/`
2. Crear un archivo de story en `widgetbook_app/lib/`
3. Usar la anotación `@WidgetbookUseCase`
4. Ejecutar:
   ```bash
   cd widgetbook_app
   flutter pub run build_runner build
   ```


---

## 👤 Autor

Alexis Jampier Yalle Alarcón

**Última actualización:** 28 de Febrero, 2026

