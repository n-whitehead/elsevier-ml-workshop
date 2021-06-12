ARG JUPYTER_NOTEBOOK=jupyter/minimal-notebook
ARG JUPYTER_VERSION=latest
FROM ${JUPYTER_NOTEBOOK}:${JUPYTER_VERSION}

USER root

##############################################################
# MANDATORY FOR ZSCALER - Include Zscaler cert in /jupyter directory
# Found here: https://elsevier.atlassian.net/wiki/spaces/TEN/pages/59535175745/SSL%2Bencryption%2BApplication%2BDevelopment%2BEnvironment%2Band%2BGuest%2BOS%2Bcompatibility%2Brequirements
##############################################################
# Zscaler Root Intermediate CA Cert - THIS WILL BE REQUIRED FOR BUILDING & RUNNING ON RELX WINDOWS HOSTS!
ARG ZSCALER_CA_CERT="ZscalerRootCertificate-2048-SHA256.crt"
# Zscaler Cert CopyTo Path Inside Container
ARG ZSCALER_CA_PATH="/usr/local/share/ca-certificates"
# Local CA Certs TrustStore Location inside Container runtime - Zscaler Cert will be imported here, so we need to for its use!
ARG REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
# Copy Zscaler Cert into the directory in our Container
COPY ${ZSCALER_ROOT_CERTS} ${ZSCALER_CA_PATH}/${ZSCALER_CA_CERT}
# Run update-ca-certificates utility to import the Zscaler certificate into Container TrustStore at runtime...
RUN ls -latr ${ZSCALER_CA_PATH}/ && ls -latr ${REQUESTS_CA_BUNDLE} && update-ca-certificates \
# Set REQUESTS_CA_BUNDLE env variable so that when we install python and py-pip it will use our custom certs bundle instead of its own...
&& export REQUESTS_CA_BUNDLE=${REQUESTS_CA_BUNDLE}
##############################################################

# Set working directory
WORKDIR /elsevier-ml-workshop

# Copy notebooks and conf scripts into the image
COPY requirements.txt ../
COPY /data /data/
COPY /notebooks /notebooks/
COPY /img /img/
COPY ./conf/ /etc/jupyter/

# Load additional requirements, upgrade pip
RUN pip3 install --upgrade pip && \
    python3 --version && \
    pip3 --version && \
    pip3 install -r ../requirements.txt

# Run jupyter lab
CMD ["jupyter", "lab"]

USER ${NB_USER}
