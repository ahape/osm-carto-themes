# Setup Guide

This guide covers setting up the environment on both Ubuntu and macOS. Once the system-specific dependencies are installed, proceed to the **Cross-Platform Setup**.

## 1. System Dependencies

### Ubuntu

```sh
sudo apt update

# Python latest
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.14 python3.14-venv -y
# Assert: python3.14 --version

# PostgreSQL
sudo apt install postgresql -y
# Assert: psql --version

# Nginx
sudo apt install nginx -y
# Assert: nginx -v

# Node/NPM (via NVM)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# Optional Use NVM in current shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Install latest version
nvm install --lts
# Assert: node -v

# Use official OpenStreetMap Administrators PPA for latest version of osm2pgsql
sudo apt update
sudo add-apt-repository ppa:osmadmins/ppa
sudo apt install osm2pgsql

# PostgreSQL Geographic Information Systems (SQL extensions)
sudo apt install postgis -y

# Mapnik (geospatial visualization & processing toolkit)
sudo apt install libmapnik-dev mapnik-utils python3-mapnik

# Start the PostgreSQL server
sudo systemctl start postgresql
# Assert: sudo systemctl status postgresql

# Initialize database users and initial DBs
# Note: this command will likely return an error message say "Permission denied ..."
# but ignore it because the command probably worked and is just noise
sudo -u postgres createuser -s $USER

# Optional: PostgreSQL convention to have matching user/db name
sudo -u postgres createdb $USER
sudo -u postgres createdb -E UTF8 -T template0 gis
```

### macOS

```sh
# Ensure Homebrew is installed and updated
brew update

# Python latest
brew install python
# Assert: python3 --version

# PostgreSQL
brew install postgresql@17
# Assert: psql --version

# Nginx
brew install nginx
# Assert: nginx -v

# Node/NPM
brew install node
# Assert: node -v

# osm2pgsql
brew install osm2pgsql

# PostgreSQL Geographic Information Systems (SQL extensions)
brew install postgis

# Mapnik (geospatial visualization & processing toolkit)
brew install mapnik

# Start the PostgreSQL server
brew services start postgresql@17
# Assert: brew services info postgresql@17

# Initialize database
# Homebrew PostgreSQL uses your macOS user by default as the superuser
createdb gis
```

## 2. Cross-Platform Setup

### Python Virtual Environment

```sh
# Create virtual environment (Note: pip installed via venv activate)
# Note: Use python3.14 if on Ubuntu, or just python3 on macOS depending on your installation
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Download Example Data

```sh
# Download an example `.pbf`
curl -O -L https://download.geofabrik.de/europe/monaco-latest.osm.pbf
```

### Initialize and Import the Database

```sh
# Assert: psql -d gis

psql -d gis -c "CREATE EXTENSION postgis;"
psql -d gis -c "CREATE EXTENSION hstore;"
psql -d gis -c "ALTER SYSTEM SET jit=off;"
psql -d gis -c "SELECT pg_reload_conf();"

# Optional check to make sure PostGIS is setup correctly
# psql -d gis -c "SELECT PostGIS_full_version();"

osm2pgsql -d gis -U $USER --create --slim -G --hstore monaco-latest.osm.pbf

cd openstreetmap-carto
osm2pgsql -d gis -O flex -S openstreetmap-carto-flex.lua ../monaco-latest.osm.pbf

# Bootstrap indexes
python3 scripts/indexes.py -0 | xargs -0 -P0 -I{} psql -d gis -c "{}"
psql -d gis -f functions.sql

# Note: not sure about this one, it's redundant somehow...
psql -d gis -f indexes.sql
```

### Kosmtik Setup

```sh
# Setup Kosmtik
cd ../kosmtik
npm install

# Run the server locally (from kosmtik dir)
node index.js serve ../openstreetmap-carto/project.mml

# If encountering an error such as this:
# "Postgis Plugin: ERROR: relation "icesheet_polygons" does not exist"
# run the script to download missing polygons or whatever
cd ../openstreetmap-carto
python3 scripts/get-external-data.py
```
