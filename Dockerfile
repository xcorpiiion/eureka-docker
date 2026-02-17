# 1. A BASE (O Chão da Fábrica)
# Mudamos de Java 17 para 21 porque seu código foi compilado no 21.
# 'eclipse-temurin' é uma distribuição Java super otimizada para containers.
# 'alpine' é o Linux ultra-leve (5MB).
FROM eclipse-temurin:21-jre-alpine

# 2. A MESA DE TRABALHO (Organização)
# Define que tudo vai acontecer dentro da pasta /app do Linux.
# Evita bagunça na raiz do sistema operacional.
WORKDIR /app

# 3. O INGREDIENTE (O Código)
# Pega o arquivo .jar que você criou com o Maven (na pasta target do seu PC)
# E joga para dentro da imagem, renomeando para 'app.jar'.
COPY target/*.jar app.jar

# 4. A ETIQUETA (Documentação)
# Avisa quem for usar essa imagem que a porta 8761 deve ser liberada.
# (Nota: Isso não abre a porta sozinho, é só documentação).
EXPOSE 8761

# 5. O START (A Execução)
# ENTRYPOINT define o comando principal.
# Diferente do CMD, ele é fixo e trata o container como um executável.
ENTRYPOINT ["java", "-jar", "app.jar"]