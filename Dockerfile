FROM ubuntu

USER root #DESCOBRI SE ESSE ISSO AQUI MESM

RUN apt-get update && apt-get upgrade  -y \
    && apt-get install -y locales \
    # && apt-get install -y sudo \
    && apt-get install -y unzip \
    && apt-get clean

RUN mkdir program
COPY openjdk-7u75-b13-linux-x64-18_dec_2014.tar program/
COPY esus.zip program/

WORKDIR /program
# INSTALL JAVA
# /usr/lib/jvm/java-11-openjdk-amd64
RUN tar -xvf openjdk-7u75-b13-linux-x64-18_dec_2014.tar
ENV JAVA_HOME=/program/java-se-7u75-ri
ENV PATH=${PATH}:${JAVA_HOME}/bin

# INSTALL PEC
RUN unzip esus.zip -d ./pec/

RUN echo "\n preparando para instalar o pec ...\n\n"
RUN chmod +x /program/pec/instalador_linux.sh
RUN locale-gen

RUN echo "\n instalando o pec ...\n\n"
RUN ./pec/instalador_linux.sh

# RUN chmod +x /opt/e-SUS/jboss-as-7.2.0.Final/bin/init.d/jboss-as-standalone-lsb.sh

WORKDIR /

# RUN ls $JAVA_HOME/
# RUN cat $PATH
# RUN ls /usr/lib/
# RUN java -version


# RUN apt-get install openjdk-7-jdk -y
    # && sudo apt-get upgrade \
# RUN apt-get update && apt-get upgrade -y \
#     && apt-get install -y apt-utils \
#     && apt-get install sudo \
#     && sudo apt-get install locales -y \
#     && sudo apt-get update && apt-get upgrade 
#     && sudo apt-get install openjdk-7-jdk -y
#     # && apt-get install -y unzip \
#     # && apt-get clean 
