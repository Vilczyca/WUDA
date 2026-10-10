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

### Create the virtual environment

A folder named `.venv` will appear:

```bash
python -m venv .venv
```

### Activate it

On Windows, run:

```powershell
.\.venv\Scripts\activate
```

You should now see `(.venv)` at the beginning of your terminal line.

### Install the required libraries

```bash
pip install -r requirements.txt
```

This installs all the Python libraries required to run the application.

## 3. Running the Application

### Prepare the database

Run the following command to apply the database migrations:

```bash
python manage.py migrate
```

### Start the application

```bash
python manage.py runserver
```

Open your browser and go to:

http://127.0.0.1:8000/

The application should now be running! If you see 404 - everything is ok.

To stop the server, press `Ctrl + C` in the terminal.

**Next time:** Navigate to the project folder, activate the virtual environment, and run `python manage.py runserver` again. You don't need to reinstall the requirements or clone the repository.