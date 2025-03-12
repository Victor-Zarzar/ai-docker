FROM python:3.10

WORKDIR /app

COPY scripts/ /app/scripts/
RUN chmod +x /app/scripts/*.sh
COPY config.json /app/config.json

RUN chmod +x /app/scripts/*.sh

CMD ["/app/scripts/run_model.sh"]
