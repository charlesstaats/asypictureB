import argparse
import os
import sys
import shutil

parser = argparse.ArgumentParser()
parser.add_argument("-V", dest="view", action="store_true", default=False)
parser.add_argument("-noV", dest="view", action="store_false")
# To be added later:
# parser.add_argument("-f", dest="format", default="pdf")
parser.add_argument("filename")
args = parser.parse_args()

if args.filename.endswith(".asy"):
  asy_filename = args.filename
  filename = args.filename[:-4]
else:
  asy_filename = args.filename + ".asy"
  filename = args.filename


if not os.path.exists(asy_filename):
  raise FileNotFoundError(asy_filename)

print("Running fake_asy on", asy_filename)
sys.stderr.write("Fake warning message while processing " + asy_filename + "\n")

shutil.copy("box.pdf", f"{filename}.pdf")
