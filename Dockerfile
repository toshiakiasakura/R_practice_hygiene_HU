FROM jupyter/datascience-notebook:python-3.9.7

WORKDIR /workdir
EXPOSE 8888

# jupyter lab extensions. 
RUN conda update -n base conda && \
    conda install -c conda-forge jupyterlab-snippets && \
    conda install -c conda-forge jupyterlab-git -y && \
    jupyter lab build

RUN pip install jupyterlab_vim

# install R 
RUN conda install r-RCurl
RUN Rscript -e "install.packages(c('surveillance'),repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "install.packages(c('openxlsx','dplyr','readr','ggplot2'),repos = 'http://cran.us.r-project.org')"

# sphinx setting
#RUN conda install sphinx -y && \
#    pip install sphinx-autodoc-typehints

