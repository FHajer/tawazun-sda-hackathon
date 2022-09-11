FROM maven:3.8.6-openjdk-11
ENV GOLDEN_DB_URL=cluster
ENV GOLDEN_DB_PORT=3306
ENV GOLDEN_DB_NAME=mysql
ENV GOLDEN_DB_USERNAME=dbSql
ENV GOLDEN_DB_PASSWORD=passwd
WORKDIR /app
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","verify","clean","--fail-never"]
COPY . .
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/tawazun.war"]