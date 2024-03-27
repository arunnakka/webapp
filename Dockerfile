# Use the official Python image as the base image
FROM python

# Set the working directory inside the container
WORKDIR /app

COPY simple_webapp.py /app/
COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["python", "simple_webapp.py"]

