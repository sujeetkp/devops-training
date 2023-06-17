FROM ubuntu
RUN apt-get update
RUN apt-get install -y python3
COPY hello.py /home/hello.py
COPY override.py /home/override.py
ENTRYPOINT ["python3"]
CMD ["/home/hello.py"]