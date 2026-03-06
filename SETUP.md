# Ubuntu Setup

```sh
sudo apt update

# Python latest
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.14 python3.14-venv -y
# Assert: python3.14 --version

# Create virtual environment (Note: pip installed via venv activate)
python3.14 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

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

# Download an example `.pbf`
curl -O -L https://download.geofabrik.de/europe/monaco-latest.osm.pbf

# Start the PostgreSQL server
sudo systemctl start postgresql
# Assert: sudo systemctl status postgresql

# -------------------------
# Initializing the database
# -------------------------

# Note: this command will likely return an error message say "Permission denied ..."
# but ignore it because the command probably worked and is just noise
sudo -u postgres createuser -s $USER

# Optional: PostgreSQL convention to have matching user/db name
sudo -u postgres createdb $USER
sudo -u postgres createdb -E UTF8 -T template0 gis
# Assert: psql -d gis

psql -d gis -c "CREATE EXTENSION postgis;"
psql -d gis -c "CREATE EXTENSION hstore;"
psql -d gis -c "ALTER SYSTEM SET jit=off;"
psql -d gis -c "SELECT pg_reload_conf();"
osm2pgsql -d gis -U $USER --create --slim -G --hstore monaco-latest.osm.pbf
cd openstreetmap-carto
osm2pgsql -d gis -O flex -S openstreetmap-carto-flex.lua ../monaco-latest.osm.pbf

# Bootstrap indexes
python3.14 scripts/indexes.py -0 | xargs -0 -P0 -I{} psql -d gis -c "{}"
psql -d gis -f functions.sql
# Note: not sure about this one, it's redundant somehow...
psql -d gis -f indexes.sql

# Setup Kosmtik
cd ../kosmtik
npm install

# Run the server locally (from kosmtik dir)
node index.js serve ../openstreetmap-carto/project.mml
```


