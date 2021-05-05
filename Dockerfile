FROM sagemath/sagemath:9.0

ENV NB_USER=sage
ENV HOME /home/sage

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_USER}:${NB_USER} ${HOME}
USER ${NB_USER}

# Install dependencies for plots
#RUN sage -pip install pandas==0.20

EXPOSE 8888
CMD ["jupyter", "notebook", "--notebook-dir=notebooks", "--ip", "'*'", "--port", "8888"]