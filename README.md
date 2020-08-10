# Elsevier Machine Learning Workshop

This project aims at creating an instructional, and interactive series 
to teach machine learning fundamentals for any role.

## Table of Contents
1. Introduction to Python \& Jupyter Notebooks
2. Concept Learning \& k-Nearest Neighbor
3. Linear Models \& Support Vector Machines (SVM)
4. Decision Trees
5. Ensemble Models
6. Performance Evaluation \& Experimental Design Techniques
7. Parametric Models, Hyper-parameter \& Model Selection
8. Dimensionality Reduction
9. Unsupervised Learning \& Clustering
10. Artifical Neural Networks
11. Deep Learning
12. Reinforcement Learning

## Installation

First, you will need to have git installed, if not done already.

Clone this repository into your desired workspace:
    
    $ git clone git@github.com:n-whitehead/elsevier-ml-workshop.git

### Required Libraries (Python)

This series will require Python 3, which is pre-installed on most systems. Check your Python version
with:

    $ python3 --version
    
Any version of Python 3 should suffice, ideally `3.6+`.

### Downloading ZScaler Cert (Windows users only)

(TODO: Mount certs to docker container https://stackoverflow.com/questions/26028971/docker-container-ssl-certificates)

Download the [ZScaler Root Certificate](https://confluence.cbsels.com/download/attachments/138391620/ZscalerRootCerts.zip?version=1&modificationDate=1572955832000&api=v2)
and place the `.crt` file in the root directory of this project.

### Run the container

In the root directory, create the Docker image for this project:

    $ docker build -t elsevier-ml-workshop .
    
This will install all the required statistics and ML packages for running the lesson notebooks.

Run the container using `docker-compose up` which will mount the appropriate volumes to the container. Once
finished, copy the address with token from the docker-compose output (ie. `http://127.0.0.1:8888/?token=<token>`) into your browser to begin navigating
the session.