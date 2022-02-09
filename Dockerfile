FROM jupyter/datascience-notebook:33add21fab64
COPY requirements.txt .
RUN pip install --user -r requirements.txt
RUN pip install torch==1.10.2+cpu torchvision==0.11.3+cpu torchaudio==0.10.2+cpu -f https://download.pytorch.org/whl/cpu/torch_stable.html
RUN rm requirements.txt
RUN npm install -g ijavascript && ijsinstall
ENV JUPYTER_ENABLE_LAB yes

CMD [ "jupyter-lab", "--port=8888", "--allow-root", "--no-browser", "--notebook-dir=/home/jovyan/work" ]
