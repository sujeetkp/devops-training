FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
COPY hello.py /home/hello.py
COPY a.py /home/a.py
CMD ["/home/hello.py"]
ENTRYPOINT ["python"]