FROM python:3.9

RUN pip install jupyter

# Installing voila & qgrid with specific version
# You can try to relax the requirements, but then the patch file will probably become invalid
RUN pip install voila==0.3.5 qgrid==1.3.1
RUN jupyter nbextension enable --py --sys-prefix qgrid

# Applying the patch described in https://github.com/voila-dashboards/voila/issues/72#issuecomment-696356918
COPY qgridXvoila.patch /tmp/qgridXvoila.patch
RUN patch -u -b /usr/local/share/jupyter/voila/templates/base/voila_setup.macro.html.j2 -i /tmp/qgridXvoila.patch

WORKDIR /notebooks/

ENTRYPOINT ["voila", "--Voila.ip=0.0.0.0", "--enable_nbextensions=True"]