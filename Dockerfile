FROM tiangolo/uvicorn-gunicorn-fastapi:python3.6

LABEL maintainer="pablowoolvett@gmail.com"

RUN pip --no-cache install \
    pandas \
    sqlalchemy \
    ludwig 
