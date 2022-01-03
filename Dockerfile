# Based on brad07x/ubuntu-jetty (multiarch)
FROM brad07x/ubuntu-jetty:9.4.36

# Image Metadata
LABEL org.opencontainers.image.authors="bstevens@havensight.net" \
      org.opencontainers.image.created="2022-01-02T18:12:34-05:00" \
      org.opencontainers.image.source="https://github.com/brad07x/docs" \
      org.opencontainers.image.documentation="https://github.com/brad07x/docs" \
      org.opencontainers.image.version="0.1.0-alpha" \
      org.opencontainers.image.title="Unofficial Ubuntu Teedy (Sismics Docs) Multiarch Image" \
      org.opencontainers.image.description="Unofficial Ubuntu Teedy (Sismics Docs) Multiarch Image"

RUN apt-get update && \
    apt-get -y -q --no-install-recommends install \
    ffmpeg \
    mediainfo \
    tesseract-ocr \
    tesseract-ocr-ara \
    tesseract-ocr-chi-sim \
    tesseract-ocr-chi-tra \
    tesseract-ocr-dan \
    tesseract-ocr-deu \
    tesseract-ocr-fin \
    tesseract-ocr-fra \
    tesseract-ocr-heb \
    tesseract-ocr-hin \
    tesseract-ocr-hun \
    tesseract-ocr-ita \
    tesseract-ocr-jpn \
    tesseract-ocr-kor \
    tesseract-ocr-lav \
    tesseract-ocr-nld \
    tesseract-ocr-nor \
    tesseract-ocr-pol \
    tesseract-ocr-por \
    tesseract-ocr-rus \
    tesseract-ocr-spa \
    tesseract-ocr-swe \
    tesseract-ocr-tha \
    tesseract-ocr-tur \
    tesseract-ocr-ukr \
    tesseract-ocr-vie && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Remove the embedded javax.mail jar from Jetty
RUN rm -f /opt/jetty/lib/mail/javax.mail.glassfish-*.jar

ADD docs.xml /opt/jetty/webapps/docs.xml
ADD docs-web/target/docs-web-*.war /opt/jetty/webapps/docs.war

ENV JAVA_OPTIONS -Xmx1g