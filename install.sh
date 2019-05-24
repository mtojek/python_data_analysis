#!/bin/bash

set -e

wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
chmod +x Anaconda3-2019.03-Linux-x86_64.sh
./Anaconda3-2019.03-Linux-x86_64.sh -b
rm Anaconda3-2019.03-Linux-x86_64.sh

./anaconda3/bin/conda init bash
source ~/.bashrc

conda install -y jupyter

jupyter notebook --generate-config

echo "c.NotebookApp.allow_remote_access = True" >> .jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '*'" >> .jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = u'sha1::a874d09fb82320933965657a3cc71f98ddf5b39f'" >> .jupyter/jupyter_notebook_config.py

screen -d -m jupyter notebook
