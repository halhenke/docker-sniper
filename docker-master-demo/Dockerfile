FROM hal9zillion/sniper-master:base

RUN apt-get update && \
  apt-get -y install python-pip \
  && rm -rf /var/lib/apt/lists/*

RUN bash scripts/compile.sh

# Use locked down requirements - particularly because of numpy v 1.15.0
COPY ./requirements.txt /root/SNIPER/requirements.txt

RUN pip install -r requirements.txt

# Necessary for demo.py
RUN pip install futures

RUN bash scripts/download_sniper_detector.sh

# Run again for some reason...?
RUN bash scripts/compile.sh

# CMD python demo.py
