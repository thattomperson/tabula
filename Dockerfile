FROM sapmachine:lts-jre-headless-ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*

ENV TABULAVERSION=1.0.5
RUN curl -L https://github.com/tabulapdf/tabula-java/releases/download/v${TABULAVERSION}/tabula-${TABULAVERSION}-jar-with-dependencies.jar > /usr/local/bin/tabula.jar

ENTRYPOINT ["java", "-jar", "/usr/local/bin/tabula.jar"]
CMD ["--help"]