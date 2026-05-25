# Sistema de Gestión de Torneos Deportivos ⚽🏆

Este repositorio contiene el diseño, modelamiento e implementación de una solución de base de datos relacional robusta para la gestión integral y automatización de torneos deportivos. El sistema centraliza la administración de encuentros, registros de participantes, asignación de arbitraje y el cálculo en tiempo real de estadísticas y clasificaciones.

---

## 🚀 Características Principales

- **Gestión de Entidades:** Control estricto y parametrización de equipos, jugadores, cuerpos técnicos y árbitros.
- **Programación de Partidos:** Registro dinámico de encuentros, asignación de escenarios y programación inteligente de ternas arbitrales.
- **Automatización de Estadísticas:** Cálculo automatizado de puntos, goles/anotaciones a favor y en contra, y estado de clasificación mediante lógica de negocio integrada directamente en el servidor.
- **Integridad y Reglas de Negocio:** Implementación de restricciones de verificación (*constraints*) y disparadores para asegurar la consistencia total de los datos en escenarios de alta concurrencia.

## 🛠️ Tecnologías Utilizadas

- **Motor de Base de Datos:** Oracle Database
- **Lenguaje de Programación:** PL/SQL (Procedimientos almacenados, Funciones, Triggers, Secuencias y Paquetes)
- **Modelamiento:** SQL Relacional (Garantizando el cumplimiento de formas normales y optimización de índices)

## 📐 Arquitectura y Componentes Clave

El núcleo del proyecto está diseñado bajo las mejores prácticas de administración de bases de datos, destacando:

- **Triggers (Disparadores):** Automatización de auditorías internas y validación de reglas de negocio previas a la inserción o actualización de marcadores.
- **Procedimientos y Funciones (PL/SQL):** Encapsulamiento de la lógica del torneo (por ejemplo, procesar el resultado de un partido y actualizar la tabla de posiciones de forma atómica).
- **Vistas Materializadas y Secuencias:** Optimización de consultas complejas para la generación de reportes de rendimiento y control seguro de identificadores únicos.

## 📂 Estructura del Repositorio

```text
├── database/
│   ├── DDL.sql            # Definición de tablas, llaves primarias/foráneas y restricciones
│   ├── DML.sql            # Datos de prueba para validación del entorno
│   ├── triggers/          # Disparadores de automatización y seguridad
│   └── procedures/        # Procedimientos almacenados y funciones de lógica de negocio
├── docs/                  # Diagramas Entidad-Relación (DER) y documentación técnica
└── README.md

## ⚙️ Instalación y Uso

1. **Clonar el repositorio:**
```bash
   git clone [https://github.com/JoseMartinez883/GestionTorneoMYSD.git](https://github.com/JoseMartinez883/GestionTorneoMYSD.git)

👥 Autor
José Alejandro Martínez - Ingeniero de Sistemas en Formación - @JoseMartinez883
