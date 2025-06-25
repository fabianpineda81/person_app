# 📇 App Personas

Aplicación Flutter para el registro, edición y eliminación de personas. Implementa arquitectura limpia (Clean Architecture) con soporte para persistencia local utilizando [Isar](https://isar.dev/).

---

## 📦 Características principales

- ✅ Registro de personas con nombre, apellidos, tipo y número de identificación, correo y dirección.
- 📝 Edición y eliminación de registros.
- 📄 Visualización detallada de cada persona.
- 📅 Persistencia de datos con Isar.
- 🧪 Manejo de estado con Riverpod.
- 🧱 Arquitectura limpia: separación por capas `domain`, `application`, `infrastructure`, `ui`.

---



## 📹 Video de muestra

Mira el funcionamiento de la aplicación en el siguiente video:

[![Ver video](https://img.youtube.com/vi/P7IiZIImLLY/0.jpg)](https://www.youtube.com/watch?v=P7IiZIImLLY)

---
## 📁 Estructura del proyecto

```
lib/
├── aplication/               # Lógica de aplicación (providers, notifiers)
├── domain/                   # Modelos y casos de uso
│   └── models/persons/       # Entidades y gateway
|   └── use_cases/
├── infrastructure/
│   └── driven_adapter/      
|       └── memory          # Adaptador de infraestructura (memoria)  
│       └── local_database/ # Adaptador de infraestructura (Isar)
│           └── isar/
│               ├── entities/
│               └── mappers/
├── ui/                       # Presentación (pantallas y widgets)
│   └── pages/
└── config/                   # Configuraciones (rutas,providers globales, etc.)
                
```

---



## 📂 Dependencias principales

| Paquete             | Descripción                       |
| ------------------- | --------------------------------- |
| flutter\_riverpod   | Manejo de estado reactivo         |
| isar                | Base de datos NoSQL local         |
| isar\_flutter\_libs | Librerías necesarias para Flutter |
| uuid                | Generación de IDs únicos          |
| equatable           | Comparación de objetos            |
| path\_provider      | Rutas del sistema de archivos     |

---

## 🧠 Notas técnicas
- La entidad `Person` del dominio **no depende de Isar**.
- Se utiliza un **Mapper** (`PersonMapper`) para convertir entre `Person` y `PersonIsar`.
- Puedes alternar entre los distintos repositorios simplemente modificando el provider:
```dart
final personRepositoryProvider = Provider<PersonGateway>((ref) {
  return PersonInMemoryRepository(); // usar este para pruebas
  // return PersonIsarRepository(); // usar este para persistencia real
});
en lib/config/providers/person_repository_provider.dart  
Esto permite cambiar la fuente de datos sin afectar el resto de la app


---


## 👤 Autor

Desarrollado por **Fabian Pineda**.

---

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Puedes usarlo libremente con fines educativos y personales.
