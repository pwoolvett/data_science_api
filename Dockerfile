FROM tiangolo/uvicorn-gunicorn:python3.6

LABEL maintainer="pablowoolvett@gmail.com"

RUN apk --update add --no-cache g++
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

# system deps
# install ludwig in different cmd from numpy (seealso:: https://stackoverflow.com/questions/51399515/docker-cannot-build-scipy)
RUN apk --update --no-cache add \
        --virtual \
        .builddeps \
        gcc \
        gfortran \
        musl-dev \
        g++
# fix pip version to alloy pyproject-based installs in editable mode
RUN pip --no-cache-dir install pip==19.0.1

# install scientific stack
RUN apk add --no-cache \
        --virtual=.build-dependencies \
        g++ gfortran file binutils \
        musl-dev python3-dev openblas-dev && \
    apk add libstdc++ openblas && \
    \
    ln -s locale.h /usr/include/xlocale.h && \
    \
    pip install numpy && \
    pip install pandas && \
    pip install scipy && \
    # pip install scikit-learn && \
    \
    rm -r /root/.cache && \
    find /usr/lib/python3.*/ -name 'tests' -exec rm -r '{}' + && \
    find /usr/lib/python3.*/site-packages/ -name '*.so' -print -exec sh -c 'file "{}" | grep -q "not stripped" && strip -s "{}"' \; && \
    \
    rm /usr/include/xlocale.h && \
    \
    apk del .build-dependencies


# python libs
# RUN pip --no-cache-dir install \
#     numpy
    # pandas \
    # numpy \
    # fastapi \
    # sqlalchemy \
    # logzero \

# RUN pip install --no-cache-dir Cython
RUN pip install --no-cache-dir \
        ludwig
#
RUN apk del .builddeps \
    && \
    rm -rf /root/.cache
