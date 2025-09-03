# Ensure Python 3.13 is installed via pyenv
pyenv install -s 3.13.0
pyenv local 3.13.0

# Create and activate virtual environment
python -m venv .venv
source .venv/bin/activate

# Upgrade pip and install Poetry inside venv
pip install --upgrade pip
pip install poetry poetry-core

# Install project dependencies
poetry install
