FROM kicad/kicad:9.0
WORKDIR /checker

USER root

COPY ./rule_check.py rule_check.py

ENTRYPOINT ["python3", "rule_check.py"]
