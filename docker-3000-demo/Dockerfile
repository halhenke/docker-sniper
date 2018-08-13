FROM hal9zillion/sniper-3000:base

# Get models
COPY ./gdrive-dload.sh ./gdrive-dload.sh

RUN ./gdrive-dload.sh 1hEG-GmMrvp--hWRU41RMBLB3gL-IdXs9 ILSVRC2014_devkit.tar \
  && mv ./ILSVRC2014_devkit.tar ./data/ILSVRC2014_devkit.tar \
  && tar -xvf ./data/ILSVRC2014_devkit.tar -C ./data \
  && rm ./data/ILSVRC2014_devkit.tar

# Use locked down requirements - particularly because of numpy v 1.15.0
COPY ./requirements.txt /root/SNIPER/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

RUN ./gdrive-dload.sh 10QOmpklDcY2eO-Lfc3IjY0b9XcTEiYY8 CRCNN-0007.params \
  && mkdir -p /root/SNIPER/output/chips_resnet101_3k/res101_mx_3k/fall11_whole \
  && mv CRCNN-0007.params /root/SNIPER/output/chips_resnet101_3k/res101_mx_3k/fall11_whole/

RUN ./gdrive-dload.sh 1fYsCF6q-bctZMNrLPQkNHJEVxL5LpnYM image.tar \
  && mv image.tar ./demo/ \
  && tar -xvf ./demo/image.tar -C ./demo \
  && rm ./demo/image.tar

# NOTE: For some reason this disappeared from the repo?
COPY ./compile.sh /root/SNIPER/scripts/

# NOTE: Pretty sure we need to reference custom MxNet build as in master branch
COPY ./init.py /root/SNIPER/init.py

# NOTE: Also need this
COPY ./demo_3k.py /root/SNIPER/demo_3k.py

# NOTE: ...and this
COPY ./demo.py /root/SNIPER/demo.py

RUN bash scripts/compile.sh

RUN apt-get update && \
  apt-get -y install \
    python-tk \
  && rm -rf /var/lib/apt/lists/*

# # Mount some stuff
# VOLUME [ "/root/SNIPER/demo_scripts" ]

# # Output/results
# VOLUME [ "/root/SNIPER/vis_result" ]

# # Video Inputs
# VOLUME [ "/root/demo/vids" ]
