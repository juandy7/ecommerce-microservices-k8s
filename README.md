# Ecommerce Microservices Kubernetes

Este proyecto implementa una arquitectura de microservicios para un sistema de ecommerce, orquestada con **Kubernetes** y preparada para entornos de desarrollo, QA y producción. Incluye automatización con scripts y pipelines, y soporta despliegues locales con Minikube.

## Estructura del Proyecto

```
/ecommerce-microservices-k8s
├── api-gateway/
│   ├── deployment.yml
│   ├── service.yml
│   └── ...
├── favourite-service/
│   ├── deployment.yml
│   ├── service.yml
│   └── ...
├── cloud-config/
│   ├── deployment.yml
│   ├── service.yml
│   └── ...
├── k8s/
│   ├── manifest/
│   │   ├── api-gateway-deployment.yaml
│   │   ├── api-gateway-service.yaml
│   │   ├── api-gateway-ingress.yaml
│   │   └── ...
│   ├── namespace-dev.yaml
│   ├── namespace-qa.yaml
│   ├── namespace-prod.yaml
│   └── ...
├── .github/
│   └── workflows/
│       └── api-gateway-pipeline-dev-pr.yml
├── compose.yml
├── deploy.sh
└── README.md
```

## Características

- **Microservicios desacoplados**: Cada servicio tiene su propio deployment y service.
- **Despliegue en Kubernetes**: Manifiestos organizados por servicio y entorno.
- **Ingress Controller**: Acceso centralizado a los servicios (por ejemplo, API Gateway).
- **Soporte para múltiples namespaces**: dev, qa, prod.
- **Automatización**: Script `deploy.sh` para aplicar todos los manifiestos.
- **CI/CD**: Workflows de GitHub Actions listos para integración y despliegue.
- **Soporte para Minikube**: Fácil despliegue y pruebas locales.

## Requisitos

- [Docker](https://www.docker.com/)
- [Minikube](https://minikube.sigs.k8s.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/) (opcional, para charts)
- [GitHub Actions](https://docs.github.com/en/actions) (para CI/CD)

## Despliegue local rápido

1. **Inicia Minikube**  
   ```bash
   minikube start
   ```

2. **Habilita el Ingress Controller**  
   ```bash
   minikube addons enable ingress
   ```

3. **Despliega todos los recursos**  
   ```bash
   ./deploy.sh
   ```

4. **(Opcional) Ejecuta el túnel de Minikube**  
   ```bash
   minikube tunnel
   ```

5. **Configura tu archivo `hosts`**  
   Agrega en Windows:
   ```
   192.168.49.2    api.local
   ```
   (Reemplaza la IP por la de tu Minikube si es diferente.)

6. **Accede a la API Gateway**  
   [http://api.local](http://api.local)

## Troubleshooting

- Si ves `ImagePullBackOff`, revisa el nombre y acceso de la imagen en el deployment.
- Si `curl http://api.local` no responde, revisa el Ingress, el túnel y el archivo `hosts`.
- Usa `kubectl get all -A` para ver el estado de todos los recursos.

## Contribución

1. Haz un fork del repositorio.
2. Crea una rama para tu feature o fix.
3. Haz tus cambios y abre un Pull Request.

---

**Licencia:** MIT

---
```# Ecommerce Microservices Kubernetes

Este proyecto implementa una arquitectura de microservicios para un sistema de ecommerce, orquestada con **Kubernetes** y preparada para entornos de desarrollo, QA y producción. Incluye automatización con scripts y pipelines, y soporta despliegues locales con Minikube.

## Estructura del Proyecto

```
/ecommerce-microservices-k8s
├── api-gateway/
│   ├── deployment.yml
│   ├── service.yml
│   └── ...
├── favourite-service/
│   ├── deployment.yml
│   ├── service.yml
│   └── ...
├── cloud-config/
│   ├── deployment.yml
│   ├── service.yml
│   └── ...
├── k8s/
│   ├── manifest/
│   │   ├── api-gateway-deployment.yaml
│   │   ├── api-gateway-service.yaml
│   │   ├── api-gateway-ingress.yaml
│   │   └── ...
│   ├── namespace-dev.yaml
│   ├── namespace-qa.yaml
│   ├── namespace-prod.yaml
│   └── ...
├── .github/
│   └── workflows/
│       └── api-gateway-pipeline-dev-pr.yml
├── compose.yml
├── deploy.sh
└── README.md
```

## Características

- **Microservicios desacoplados**: Cada servicio tiene su propio deployment y service.
- **Despliegue en Kubernetes**: Manifiestos organizados por servicio y entorno.
- **Ingress Controller**: Acceso centralizado a los servicios (por ejemplo, API Gateway).
- **Soporte para múltiples namespaces**: dev, qa, prod.
- **Automatización**: Script `deploy.sh` para aplicar todos los manifiestos.
- **CI/CD**: Workflows de GitHub Actions listos para integración y despliegue.
- **Soporte para Minikube**: Fácil despliegue y pruebas locales.

## Requisitos

- [Docker](https://www.docker.com/)
- [Minikube](https://minikube.sigs.k8s.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/) (opcional, para charts)
- [GitHub Actions](https://docs.github.com/en/actions) (para CI/CD)

## Despliegue local rápido

1. **Inicia Minikube**  
   ```bash
   minikube start
   ```

2. **Habilita el Ingress Controller**  
   ```bash
   minikube addons enable ingress
   ```

3. **Despliega todos los recursos**  
   ```bash
   ./deploy.sh
   ```

4. **(Opcional) Ejecuta el túnel de Minikube**  
   ```bash
   minikube tunnel
   ```

5. **Configura tu archivo `hosts`**  
   Agrega en Windows:
   ```
   192.168.49.2    api.local
   ```
   (Reemplaza la IP por la de tu Minikube si es diferente.)

6. **Accede a la API Gateway**  
   [http://api.local](http://api.local)

## Troubleshooting

- Si ves `ImagePullBackOff`, revisa el nombre y acceso de la imagen en el deployment.
- Si `curl http://api.local` no responde, revisa el Ingress, el túnel y el archivo `hosts`.
- Usa `kubectl get all -A` para ver el estado de todos los recursos.

## Contribución

1. Haz un fork del repositorio.
2. Crea una rama para tu feature o fix.
3. Haz tus cambios y abre un Pull Request.

---

**Licencia:** MIT

---