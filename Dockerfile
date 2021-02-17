FROM library/ubuntu:latest as builder

ARG BW_VERSION=1.14.0

RUN apt update -y && apt install -y wget unzip

RUN cd /tmp && wget https://github.com/bitwarden/cli/releases/download/v${BW_VERSION}/bw-linux-${BW_VERSION}.zip && \
    unzip /tmp/bw-linux-${BW_VERSION}.zip

FROM library/ubuntu:latest

COPY --from=builder /tmp/bw /usr/local/bin/bw

RUN chmod +x /usr/local/bin/bw

# Create an app user so our program doesn't run as root.
RUN groupadd -r noroot &&\
    useradd -r -g noroot -d /bw -s /sbin/nologin -c "Docker image user" noroot &&\
    mkdir -p /bw && chown -R noroot:noroot /bw

# Set the home directory to our app user's home.
ENV HOME=/bw

WORKDIR /bw
USER noroot

ENTRYPOINT [ "/usr/local/bin/bw" ]
CMD [ "--help" ]