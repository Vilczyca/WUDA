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

## 2. Virtual Environment and Requirements

Think of a virtual environment as an isolated, soundproof box for this specific project. It ensures that the Python libraries we install for this app don't mess up any other applications on your computer.

We use **uv** to manage Python dependencies and the virtual environment. It is an alternative to manually creating a virtual environment and installing packages with `pip`.

### What are `pyproject.toml` and `uv.lock`?

- **`pyproject.toml`** contains project configuration and information about the Python libraries the application needs.
- **`uv.lock`** records the exact versions of dependencies so that the same versions can be installed consistently on different computers.

Both files should be included in the repository.

### Option A: Use a virtual environment

#### Create the virtual environment

A folder named `.venv` will appear:

```bash
python -m venv .venv
```

#### Activate it

On Windows, run:

```powershell
.\.venv\Scripts\activate
```

You should now see `(.venv)` at the beginning of your terminal line.

#### Install the required libraries

```bash
pip install -r requirements.txt
```

This installs all the Python libraries required to run the application.

Once the virtual environment is activated, use the commands shown in the following sections normally, without adding `uv run` before them.

### Option B: Use uv

If the project is configured with `pyproject.toml` and `uv.lock`, you can let uv manage the environment automatically.

Install uv by following the [official installation guide](https://docs.astral.sh/uv/getting-started/installation/).

To install the project dependencies and prepare the virtual environment, run:

```bash
uv sync
```

You do not need to activate `.venv` manually. Instead of running commands directly, prefix them with `uv run`, for example:

```bash
uv run python manage.py check
```

The following sections show the commands using Option A. If you choose Option B, use the equivalent commands with `uv run`.

## 3. Running the Application

### Prepare the database

Run the following command to apply the database migrations:

- With `.venv` activated, run the command as shown.
- Alternatively, prefix the command with `uv run` to run it without activating the virtual environment.

```bash
python manage.py migrate
```

### Start the application

```bash
python manage.py runserver
```


Open your browser and go to:

[http://127.0.0.1:8000/](http://127.0.0.1:8000/)

The application should now be running! If you see 404 - everything is ok.

To stop the server, press `Ctrl + C` in the terminal.

**Next time:** Navigate to the project folder, activate the virtual environment, and run `python manage.py runserver` again. You don't need to reinstall the requirements or clone the repository. If you use uv, simply run `uv run python manage.py runserver` without activating the environment.
