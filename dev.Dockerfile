FROM pwoolvett/data-science-api:${TAG:-latest}

LABEL maintainer="pablowoolvett@gmail.com"

ARG POETRY_VERSION
ARG FIX_PIP_VERSION

ENV \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=${POETRY_VERSION:-1.0.0a2} \
    FIX_PIP_VERSION=${FIX_PIP_VERSION:-19.0.3}

RUN pip install \
        --no-cache-dir \
        --upgrade \
        pip=="$PIP_FIX_VERSION" \
    && \
    pip install \
        --no-cache-dir \
        poetry=="$POETRY_VERSION" \
    && \
    mkdir -p ~/.config/pypoetry/ \
    && \
    touch ~/.config/pypoetry/config.toml \
    && \
    poetry config settings.virtualenvs.create false

CMD python -c "import numpy as np; print(np.zeros((1,2)))"

