#!/bin/bash


: '
	This script assumes that python and pip are installed. Furthermore, it assumes
	that you have a virtual python environment setup and is currently activated
'

# Install python prerequisites
pip3 install torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html
pip3 install --upgrade --force-reinstall git+https://github.com/arogozhnikov/einops.git
pip3 install git+https://github.com/finetuneanon/transformers@gpt-neo-localattention3-rp-b
pip3 install gdown
pip3 install npu

# GPT-J install and unpack
gdown https://drive.google.com/uc?id=1VXXCMR_ETxOd3rxG4eXxS4-QA5NekB3H
mkdir -p ./gptj_model
tar -xvf neo_6b.tar -C ./gptj_model
ls -l ./gptj_model/j6b_ckpt

# CARPing 
apt-get install -y unzip
wget http://the-eye.eu/public/AI/carp_seq2seq.zip
unzip carp_seq2seq.zip