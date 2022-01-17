FROM jupyter/datascience-notebook:33add21fab64
COPY requirements.txt .
RUN pip install --user -r requirements.txt
RUN rm requirements.txt
RUN npm install -g ijavascript && ijsinstall
ENV JUPYTER_ENABLE_LAB yes

CMD [ "jupyter-lab", "--port=8888", "--allow-root", "--no-browser" ]
