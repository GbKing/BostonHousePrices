# Use the official Python image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy all files into the container
COPY . /app

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port Heroku will use
EXPOSE $PORT

# Run the application
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app

