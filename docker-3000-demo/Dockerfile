FROM hal9zillion/sniper-3000:base

# Get models
COPY ./gdrive-dload.sh ./gdrive-dload.sh

RUN ./gdrive-dload.sh 1hEG-GmMrvp--hWRU41RMBLB3gL-IdXs9 ILSVRC2014_devkit.tar

RUN mv ./ILSVRC2014_devkit.tar ./data/ILSVRC2014_devkit.tar \
  && tar -xvf ./data/ILSVRC2014_devkit.tar -C ./data \
  && rm ./data/ILSVRC2014_devkit.tar
# RUN wet https://doc-0k-2o-docs.googleusercontent.com/docs/securesc/140ggf537nf1o91rmda1uhst3cb55e0q/g4chd4tsnvqqig39fgp7ktnjmjhvb6dn/1531000800000/12246240124431421317/16635039061958009288/1hEG-GmMrvp--hWRU41RMBLB3gL-IdXs9?e=download&h=12166040844953652878&nonce=18bc8n85c4m8o&user=16635039061958009288&hash=3hff6mr7fpmdj39na8p2elnt1hv4vmiv

# Use locked down requirements - particularly because of numpy v 1.15.0
COPY ./requirements.txt /root/SNIPER/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

RUN ./gdrive-dload.sh 10QOmpklDcY2eO-Lfc3IjY0b9XcTEiYY8 CRCNN-0007.params \
  && mkdir -p /root/SNIPER/output/chips_resnet101_3k/res101_mx_3k/fall11_whole \
  && mv CRCNN-0007.params /root/SNIPER/output/chips_resnet101_3k/res101_mx_3k/fall11_whole/
  # && mv CRCNN-0007.params /root/SNIPER/output

RUN ./gdrive-dload.sh 1fYsCF6q-bctZMNrLPQkNHJEVxL5LpnYM image.tar
RUN mv image.tar ./demo/ \
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

# TODO: Should have done this earlier but caching
# RUN mkdir -p /root/SNIPER/output/chips_resnet101_3k/res101_mx_3k/fall11_whole \
#   && mv output/CRCNN-0007.params output/chips_resnet101_3k/res101_mx_3k/fall11_whole/CRCNN-0007.params

# # Necessary for demo.py
# RUN pip install futures

# RUN bash scripts/download_sniper_detector.sh

# # Run again for some reason...?
# RUN bash scripts/compile.sh

# # CMD python demo.py

# # CMD cp data/demo/demo_detections.jpg /root/out

# Mount some stuff
VOLUME [ "/root/SNIPER/demo_scripts" ]

# Output/results
VOLUME [ "/root/SNIPER/vis_result" ]

# Video Inputs
VOLUME [ "/root/demo/vids" ]
