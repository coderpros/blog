import os, sys

from rich import print
from rich.columns import Columns
from rich.text import Text

try:
    path = sys.argv[1]
except IndexError:
    print("Usage listDir.py: [DIRECTORY]")
