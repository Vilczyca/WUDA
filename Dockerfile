FROM python:3.14-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/app/.venv/bin:$PATH"

WORKDIR /app

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy dependency definitions first
COPY pyproject.toml uv.lock ./

# Install production dependencies without installing the project itself
RUN uv sync --locked --no-dev --no-install-project

# Copy application code
COPY . .

RUN python manage.py collectstatic --noinput


EXPOSE 8000

CMD ["sh", "-c", "python manage.py migrate && exec gunicorn mysite.wsgi:application --bind 0.0.0.0:8000"]