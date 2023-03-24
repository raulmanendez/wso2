ARG USERNAME=raul_manendez
ARG USER_UID=15015
ARG USER_GID=$USER_UID

# Create the user
RUN useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

FROM openjdk:8-jre-alpine3.9
# copy only the artifacts we need from the first stage and discard the rest
COPY ./wso2-0.0.1-SNAPSHOT.jar /demo.jar
# set the startup command to execute the jar
CMD ["java", "-jar", "/demo.jar"]
