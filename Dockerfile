FROM tiangolo/uvicorn-gunicorn-fastapi:python3.6

LABEL maintainer="pablowoolvett@gmail.com"

RUN pip --no-cache install \
    pandas \
    sqlalchemy \
    ludwig 
    
CMD python -c "import numpy as np; print(np.zeros((1,2)))"
