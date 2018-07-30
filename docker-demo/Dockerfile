FROM hal9zillion/sniper-master:base

RUN apt-get update && \
  apt-get -y install python-pip \
  && rm -rf /var/lib/apt/lists/*

RUN bash scripts/compile.sh

RUN pip install -r requirements.txt

# Necessary for demo.py
RUN pip install futures

RUN bash scripts/download_sniper_detector.sh

# Run again for some reason...?
RUN bash scripts/compile.sh

# CMD python demo.py

# CMD cp data/demo/demo_detections.jpg /root/out

