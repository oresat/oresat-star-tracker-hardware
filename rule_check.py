import sys
import subprocess
from pathlib import Path

sch_path = (
    Path(__file__).parent
    / "hardware"
    / "star-tracker-card"
    / "star-tracker-card_1.kicad_sch"
)

# run ERC
cmd = [
    "kicad-cli",
    "sch",
    "erc",
    "--exit-code-violations",
    str(sch_path),
]

# do the rules check
result = subprocess.run(cmd)
erc_violation = result.returncode

if erc_violation > 0:
    sys.exit(1)
else:
    sys.exit(0)
