FROM registry.astralinux.ru/astra/ubi17:1.7.5
RUN apt update && apt -qy dist-upgrade
RUN apt install -qy gcc musl-dev
RUN apt install -qy python3 python3-pip
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run", "--debug"]