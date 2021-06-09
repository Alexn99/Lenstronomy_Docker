# Lenstronomy_Docker
Base files and guide for building a docker image for Lenstronomy.

## Usage Guide
1. Add any additional dependancies required to requirements.in
2. Update requirements.txt by running: 
> pip-compile requirements.in > requirements.txt

Note that pip-tools is required, preferably on the same OS and python version (ubuntu 20.04, python3.9).

3. Replace "Simple_Substructure" with your own code folder. Note that Dockerfile must be edited to reflect the new folder name.
4. The default launch command is
> python3.9 main.py

You can edit this as needed in Dockerfile or override it when launching the container.

5. Consider including a launch script (e.g. nfw_iter.sh in Simple_Substructure) to simplify container management if main.py does not sufficiently handle execution.
6. Be sure to save necessary output (write data to file, save figures, etc) instead of printing/showing generated data/plots.
