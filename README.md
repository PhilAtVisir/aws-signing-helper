# aws-signing-helper
AWS Roles AnyWhere Signing Helper

## Docker build
```
docker buildx build --platform linux/arm64 --load -t aws-signing-helper:latest .
docker buildx build --platform linux/amd64 --load -t aws-signing-helper:latest .
docker buuild
```

## Docker run
```
docker run -it aws-signing-helper:latest
```
