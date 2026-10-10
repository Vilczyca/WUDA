# First steps for a non-Python person 🐍

## 1. Python, Git and Clone Repository

### Python

Download and install Python from the [official website](https://www.python.org/downloads/).

During installation, make sure to check **Add Python to PATH** if this option is available.

To verify that Python is installed, open a terminal and run:

```bash
python --version
```

### Git

Download and install Git from the [official website](https://git-scm.com/downloads).

### Clone the repository

Download the project code to your computer and navigate into the project folder:

```bash
git clone https://github.com/Vilczyca/WUDA.git
cd WUDA
```

## 2. Virtual Environment and Dependencies

Think of a virtual environment as an isolated, soundproof box for this specific project. It ensures that the Python libraries we install for this app don't mess up any other applications on your computer.

We use **uv** to manage Python dependencies and the virtual environment.

### What are `pyproject.toml` and `uv.lock`?

- **`pyproject.toml`** contains project configuration and information about the Python libraries the application needs.
- **`uv.lock`** records the exact versions of dependencies so that the same versions can be installed consistently on different computers.

Both files should be included in the repository. We use these files instead of `requirements.txt`.

### Install uv

Install uv by following the [official installation guide](https://docs.astral.sh/uv/getting-started/installation/).

### Install dependencies

From the project directory, run:

```bash
uv sync
```

This installs the project dependencies and prepares the `.venv` virtual environment automatically.

You do not need to activate `.venv` manually. Prefix commands with `uv run` to run them in the project environment, for example:

```bash
uv run python manage.py check
```

## 3. Running the Application Locally

### Prepare the database

Run the following command to apply the database migrations:

```bash
uv run python manage.py migrate
```

### Start the application

Start application with:

```bash
uv run python manage.py runserver
```

**Note**: For local development on Windows, use Django's development server. Docker runs the application using Gunicorn inside a Linux container.

Open your browser and go to:

[http://127.0.0.1:8000/](http://127.0.0.1:8000/)

The application should now be running! If you see a 404 page, everything is okay.

To stop the server, press `Ctrl + C` in the terminal.

**Next time:** Navigate to the project folder and run `uv run python manage.py runserver` again. You don't need to reinstall the dependencies or clone the repository.
## 4. Running with Docker

Docker lets you run the application in a container without manually installing Python and project dependencies on your computer.

### Install Docker

Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop/).

Make sure Docker Desktop is running before executing Docker commands.

### Build the Docker image

From the project directory, run:

```bash
docker build -t wuda .
```

This builds a Docker image named `wuda` using the project's `Dockerfile`.

### Start the application

```bash
docker run --rm -p 8000:8000 --env-file .env wuda
```

This starts the application in a container, loads environment variables from `.env`, and makes the application available on port 8000.

Open your browser and go to:

[http://127.0.0.1:8000/](http://127.0.0.1:8000/)

To stop the application, press `Ctrl + C`. The `--rm` option automatically removes the container when it stops.

**Next time:** You don't need to rebuild the image unless the application code, dependencies, or Docker configuration have changed. Simply run:

```bash
docker run --rm -p 8000:8000 --env-file .env wuda
```

**Note:** Make sure the `.env` file exists in the project directory and contains the required environment variables. Do not commit this file if it contains secrets.

## Additional tools

### Code linting (Ruff)

Ruff checks Python code for style issues, unused imports, and other common errors.

```bash
uv run ruff check .
uv run ruff check . --fix
```
