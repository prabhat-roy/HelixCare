FROM locustio/locust:2.32.0
COPY locustfile.py /mnt/locust/locustfile.py
EXPOSE 8089
ENTRYPOINT ["locust"]
CMD ["-f", "/mnt/locust/locustfile.py"]
