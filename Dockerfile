FROM python:3.8-slim
MAINTAINER Nate Whitehead <n.whitehead@elsevier.com>

##############################################################
# Zscaler Root Intermediate CA Cert - THIS WILL BE REQUIRED FOR BUILDING & RUNNING ON RELX WINDOWS HOSTS!
ARG ZSCALER_CA_CERT="ZscalerRootCertificate-2048-SHA256.crt"
# Zscaler Cert CopyTo Path Inside Container
ARG ZSCALER_CA_PATH="/usr/local/share/ca-certificates"
# Local CA Certs TrustStore Location inside Container runtime - Zscaler Cert will be imported here, so we need to for its use!
ARG REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
# Install ca-certificates package so we can import Zscaler certificate into Container at runtime...
RUN apt-get update && \
    apt-get install -y ca-certificates
RUN rm -rf /var/cache/apk/*
# Copy Zscaler Cert into the directory in our Container
COPY ${ZSCALER_CA_CERT} ${ZSCALER_CA_PATH}/${ZSCALER_CA_CERT}
# Run update-ca-certificates utility to import the Zscaler certificate into Container TrustStore at runtime...
RUN ls -latr ${ZSCALER_CA_PATH}/ && ls -latr ${REQUESTS_CA_BUNDLE} && update-ca-certificates \
# Set REQUESTS_CA_BUNDLE env variable so that when we install python and py-pip it will use our custom certs bundle instead of its own...
&& export REQUESTS_CA_BUNDLE=${REQUESTS_CA_BUNDLE}
##############################################################

RUN pip3 install --upgrade pip && \
    python3 --version && \
    pip3 --version

WORKDIR /elsevier-ml-workshop

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY /data /data/
COPY /notebooks /notebooks/
COPY /img /img/

ENTRYPOINT ["jupyter", "lab", "--allow-root", "--ip=*", "--port=8888", "--no-browser"]
