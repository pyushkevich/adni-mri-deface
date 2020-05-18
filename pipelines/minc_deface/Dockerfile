FROM nistmni/minc-toolkit:latest
COPY bic-pipelines /opt/bic-pipelines
USER root
RUN ln -s /opt/minc/share/* /opt/minc/1.9.15/share/

USER nistmni
COPY deface_adni.sh /home/nistmni/
