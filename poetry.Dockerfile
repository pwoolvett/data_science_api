ARG VERSION
FROM pwoolvett/data-science-api:${VERSION}

LABEL maintainer="Pablo Woolvett <pablowoolvett@gmail.com>"

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.0.0a2

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir --upgrade poetry==1.0.0a2
RUN mkdir -p ~/.config/pypoetry/ \
    && \
    touch ~/.config/pypoetry/config.toml \
    && \
    poetry config settings.virtualenvs.create false
