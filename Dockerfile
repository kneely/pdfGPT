# Stage 1: Langchain-serve
FROM python:3.8-slim-buster as langchain-serve-img

RUN pip3 install --no-cache-dir langchain-serve api

CMD [ "lc-serve", "deploy", "local", "api" ]

# Stage 2: Pdf-gpt
FROM python:3.8-slim-buster as pdf-gpt-img

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "app.py" ]
