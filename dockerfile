FROM ubuntu:20.04
ENV JAVA_HOME=/u01/middleware/jdk-11
ENV PATH=${PATH}:${JAVA_HOME}/bin

RUN mkdir -p /u01/middleware/
RUN mkdir -p /u01/applications/

WORKDIR /u01/middleware/
ADD https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz .

RUN tar -xzvf openjdk-11+28_linux-x64_bin.tar.gz
RUN rm openjdk-11+28_linux-x64_bin.tar.gz

COPY target/tokengenerator-1.0.jar /u01/applications/
CMD java -cp /u01/applications/tokengenerator-1.0.jar com.tg.service.TokenGeneratorService