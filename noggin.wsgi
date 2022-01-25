activate_this = '/opt/noggin/.cache/pypoetry/virtualenvs/noggin-aaa-68fdWtgC-py3.10/bin/activate_this.py'
with open(activate_this) as file_:
    exec(file_.read(), dict(__file__=activate_this))

from noggin.app import create_app
import os

os.environ['NOGGIN_CONFIG_PATH'] = '/etc/noggin/noggin.cfg'

application = create_app()