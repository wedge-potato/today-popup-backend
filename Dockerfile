#######################################
###### Build Spring Application #######
#######################################
FROM openjdk:17-alpine AS builder

WORKDIR /build

# Gradle Wrapper와 설정 파일 복사
COPY gradlew /build/
COPY gradle /build/gradle
COPY build.gradle settings.gradle /build/

# Gradle Wrapper 실행 권한 부여
RUN chmod +x /build/gradlew

# 종속성 다운로드 및 캐싱
RUN ./gradlew dependencies || true

# 소스 코드 복사 후 애플리케이션 빌드
COPY src /build/src
RUN ./gradlew build -x test --parallel --stacktrace

#######################################
###### Run Spring Application #######
#######################################
FROM openjdk:17-alpine

ENV	PROFILE local

# 빌더 이미지에서 JAR 파일 복사
COPY --from=builder /build/build/libs/*.jar /app.jar

# 8080 포트 노출
EXPOSE 8080

# 애플리케이션 실행
ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILE}", "-jar", "/app.jar"]
