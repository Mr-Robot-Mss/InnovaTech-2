# Proyecto Semestral DevOps - AWS EKS + Terraform + GitHub Actions

## Integrante

- Massimo Tomás Navarrete Rojas

---

# Descripción del Proyecto

Este proyecto tiene como objetivo implementar una arquitectura DevOps completa en AWS utilizando contenedores Docker, Kubernetes (EKS), Terraform y GitHub Actions para automatizar el ciclo de vida de despliegue de una aplicación compuesta por:

- Frontend React + Vite
- Backend Ventas (Spring Boot)
- Backend Despachos (Spring Boot)

La solución permite desplegar automáticamente nuevas versiones de la aplicación mediante integración y entrega continua (CI/CD), garantizando escalabilidad, disponibilidad y automatización de infraestructura.

---

# Arquitectura de la Solución

```text
GitHub Repository
        │
        ▼
GitHub Actions
        │
        ├── Build Frontend
        ├── Build Backend Ventas
        └── Build Backend Despachos
        │
        ▼
Amazon ECR
        │
        ├── proyecto-frontend
        ├── proyecto-backend-ventas
        └── proyecto-backend-despachos
        │
        ▼
Amazon EKS
        │
        ├── Frontend Pods
        ├── Backend Ventas Pods
        ├── Backend Despachos Pods
        └── Horizontal Pod Autoscaler (HPA)
```

---

# Tecnologías Utilizadas

## Infraestructura

- AWS EKS
- AWS ECR
- AWS VPC
- AWS Subnets
- AWS Internet Gateway
- Terraform

## Contenedores

- Docker
- Kubernetes

## Automatización

- GitHub Actions

## Backend

- Java 17
- Spring Boot
- Maven

## Frontend

- React
- Vite
- Nginx

---

# Estructura del Proyecto

```text
PROYECTO_SEMESTRAL
│
├── .github
│   └── workflows
│       └── deploy.yml
│
├── back-Despachos_SpringBoot
│
├── back-Ventas_SpringBoot
│
├── front_despacho
│
├── infra
│   └── terraform
│       ├── provider.tf
│       ├── variables.tf
│       ├── vpc.tf
│       ├── ecr.tf
│       ├── eks.tf
│       ├── outputs.tf
│       ├── main.tf
│       └── k8s
│           ├── frontend.yaml
│           ├── backend-ventas.yaml
│           ├── backend-despachos.yaml
│           ├── hpa.yaml
│           └── secret-db.yaml
```

---

# Infraestructura como Código (Terraform)

Terraform fue utilizado para automatizar la creación de:

- VPC personalizada
- Subredes públicas
- Internet Gateway
- Route Tables
- Amazon ECR
- Amazon EKS
- Node Group Kubernetes

## Configuración de Nodos

```text
Tipo Instancia: t3.medium
Cantidad Inicial: 2
Mínimo: 1
Máximo: 3
```

---

# Contenedorización

Cada componente fue empaquetado utilizando Docker.

## Frontend

```text
React + Vite
Nginx
Puerto 80
```

## Backend Ventas

```text
Spring Boot
Puerto 8080
```

## Backend Despachos

```text
Spring Boot
Puerto 8081
```

---

# CI/CD con GitHub Actions

Se implementó un pipeline automatizado que se ejecuta al realizar cambios en la rama principal.

## Flujo

```text
Push a main
      │
      ▼
Build Docker Images
      │
      ▼
Push a Amazon ECR
      │
      ▼
Actualización de Kubernetes
      │
      ▼
Validación de Servicios
```

## Beneficios

- Automatización completa
- Reducción de errores manuales
- Despliegues repetibles
- Integración continua

---

# Kubernetes

Se implementaron los siguientes recursos:

## Deployments

- frontend
- backend-ventas
- backend-despachos

## Services

### Frontend

```text
Tipo: LoadBalancer
```

Permite exponer la aplicación hacia Internet.

### Backends

```text
Tipo: ClusterIP
```

Permiten comunicación interna dentro del clúster.

---

# Escalabilidad Horizontal

Se implementó Horizontal Pod Autoscaler (HPA).

## Configuración

```text
Réplicas mínimas: 2
Réplicas máximas: 5
CPU objetivo: 70%
```

Esta configuración permite aumentar o disminuir automáticamente la cantidad de Pods según la carga del sistema.

---

# Resultados Obtenidos

Durante las pruebas se logró:

- Creación automática de infraestructura AWS mediante Terraform.
- Construcción automática de imágenes Docker.
- Publicación automática en Amazon ECR.
- Despliegue exitoso en Amazon EKS.
- Exposición pública del frontend mediante Load Balancer.
- Escalabilidad horizontal mediante HPA.
- Automatización completa mediante GitHub Actions.

---

# Evidencias de Funcionamiento

## Pods Kubernetes

```bash
kubectl get pods
```

Resultado:

```text
backend-despachos-868585cd65-qrb4h   Running
backend-despachos-868585cd65-wklfd   Running
backend-ventas-6cb6665dbc-9fvb9      Running
backend-ventas-6cb6665dbc-9l4hs      Running
frontend-8fbc7899d-bw5qx             Running
frontend-8fbc7899d-t5w8x             Running
```

## Servicios Kubernetes

```bash
kubectl get svc
```

Resultado:

```text
backend-despachos   ClusterIP
backend-ventas      ClusterIP
frontend            LoadBalancer
```

## Horizontal Pod Autoscaler

```bash
kubectl get hpa
```

Resultado:

```text
backend-despachos-hpa
backend-ventas-hpa
frontend-hpa
```

---

# Conclusiones

La implementación permitió aplicar conceptos fundamentales de DevOps utilizando herramientas modernas de automatización e infraestructura como código.

La solución desarrollada demuestra la capacidad de:

- Automatizar infraestructura cloud.
- Gestionar contenedores mediante Kubernetes.
- Implementar integración y despliegue continuo.
- Diseñar soluciones escalables y altamente disponibles.
- Aplicar buenas prácticas profesionales en entornos productivos.

El resultado final corresponde a una arquitectura completamente automatizada capaz de desplegar aplicaciones modernas en AWS utilizando Terraform, Docker, Kubernetes y GitHub Actions.