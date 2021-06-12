# Elsevier Machine Learning Workshop

This project aims at creating an instructional, and interactive series 
to teach machine learning fundamentals for any role.

## Table of Contents
1. Introduction to Python \& Jupyter Notebooks
2. Concept Learning \& k-Nearest Neighbor
3. Linear Models \& Support Vector Machines
4. Decision Trees
5. Ensemble Models
6. Performance Evaluation \& Experimental Design Techniques
7. Parametric Models, Hyper-parameter \& Model Selection
8. Dimensionality Reduction
9. Unsupervised Learning \& Clustering
10. Artificial Neural Networks
11. Deep Learning
12. Reinforcement Learning

UPDATE: To create a more focused curriculum for the Knowledge Discovery efforts, I will add topics around machine learning Knowledge Graphs. I have not figured out a way to introduce these topics - stay tuned.

## Installation

Clone this repository into your desired workspace:
    
    $ git clone git@github.com:n-whitehead/elsevier-ml-workshop.git

### Downloading ZScaler Cert (Windows users only)

Ideally, we would set up a script to download the cert into the container on creation.

Download the [ZScaler Root Certificate](https://elsevier.atlassian.net/wiki/download/attachments/59535175745/ZscalerRootCerts.zip), open the `ZscalerRootCerts` directory, and move the `ZscalerRootCertificate-2048-SHA256.crt` file to the root directory of this project.

### Run the container

In the root directory of this project, build the Docker service for this project:

    $ docker compose build
    
This will install all the required statistics and ML packages for running the lesson notebooks.

Start the container with 
    
    $ docker-compose up

which will mount the appropriate volumes to the container. Once finished, copy one of the addresses with an attached token from the docker-compose output into your browser to begin navigating the session.

![Jupyter URL with attached session token](img/readme/session.png?raw=true "Jupyter URL with attached session token")

### Contributing to the project

The `master` branch will have completed content, while the `develop` branch will have content in progress. If you would like to contribute a topic, or if you find any errors in the code/markdown, please fork the repo and create a pull request! Let's make this a collaborative effort to improve ML understanding.