# 基于官方的 Jupyter Notebook 镜像
FROM jupyter/base-notebook:latest

# 设置工作目录
WORKDIR /workspace

# 安装必要的依赖包
RUN pip install --no-cache-dir notebook

# 配置 Jupyter Notebook，不需要 token
RUN jupyter notebook --generate-config && \
    echo "c.NotebookApp.token = ''" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.allow_remote_access = True" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.port = 7860" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.notebook_dir = '/workspace'" >> /home/jovyan/.jupyter/jupyter_notebook_config.py

# 暴露 Jupyter Notebook 端口
EXPOSE 7860

# 运行 Jupyter Notebook
CMD ["jupyter", "notebook"]
