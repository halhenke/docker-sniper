FROM sniper-3000

# Get models
COPY ./gdrive-dload.sh ./gdrive-dload.sh
RUN ./gdrive-dload.sh

RUN mv ./ILSVRC2014_devkit.tar ./data/ILSVRC2014_devkit.tar \
  && tar -xvf ./data/ILSVRC2014_devkit.tar -C ./data \
  && rm ./data/ILSVRC2014_devkit.tar
# RUN wet https://doc-0k-2o-docs.googleusercontent.com/docs/securesc/140ggf537nf1o91rmda1uhst3cb55e0q/g4chd4tsnvqqig39fgp7ktnjmjhvb6dn/1531000800000/12246240124431421317/16635039061958009288/1hEG-GmMrvp--hWRU41RMBLB3gL-IdXs9?e=download&h=12166040844953652878&nonce=18bc8n85c4m8o&user=16635039061958009288&hash=3hff6mr7fpmdj39na8p2elnt1hv4vmiv

RUN pip install -r requirements.txt

# RUN bash scripts/compile.sh

# # Necessary for demo.py
# RUN pip install futures

# RUN bash scripts/download_sniper_detector.sh

# # Run again for some reason...?
# RUN bash scripts/compile.sh

# # CMD python demo.py

# # CMD cp data/demo/demo_detections.jpg /root/out

