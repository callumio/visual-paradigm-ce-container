FROM debian:latest

LABEL maintainer="git@cleslie.uk"

ENV _JAVA_AWT_WM_NONREPARENTING=1
ENV PUID=1000
ENV PGID=1000
ENV DISPLAY=:0

RUN apt-get update -y && apt-get install curl tar default-jdk -y
RUN mkdir VP
RUN curl -L https://www.visual-paradigm.com/downloads/vpce/Visual_Paradigm_CE_Linux64_InstallFree.tar.gz | tar xz -C VP --strip-components=1
WORKDIR /VP/

CMD [ "./Visual_Paradigm" ]
