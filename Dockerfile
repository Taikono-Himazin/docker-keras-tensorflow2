FROM tensorflow/tensorflow:2.0.1-gpu-py3-jupyter
LABEL maintainer='username'

WORKDIR /jupyter

RUN apt-get update && apt-get install -y \
	graphviz\
	wget\
	vim\
	git

RUN pip --no-cache-dir install \
	keras\
	opencv-python\
	pillow\
	tqdm\
	jupyter_contrib_nbextensions\
	https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master\
	pydot\
	graphviz

EXPOSE 8888

COPY jupyter_notebook_config.py ../root/.jupyter/

RUN jupyter nbextensions_configurator enable --user
RUN jupyter contrib nbextension install --user


