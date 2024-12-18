import sys
from pathlib import Path


def main():
    path = Path(sys.argv[1])
    lines = open(path, "r").read().strip().splitlines()
    for n, line in enumerate(lines):
        open(f"{path.stem}_wers{n}{path.suffix}", "w").write(line)

if __name__ == '__main__':
    main()