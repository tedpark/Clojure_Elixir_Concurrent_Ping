FROM openjdk:8-alpine

COPY target/uberjar/ping_clojure.jar /ping_clojure/app.jar

EXPOSE 3000

CMD ["java", "-jar", "/ping_clojure/app.jar"]
