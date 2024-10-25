#!/bin/bash
# 원하는 Python 버전 설정
PYTHON_VERSION=3.11

# Python 설치
apt-get update
apt-get install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-dev python3-pip

# pip 버전 업데이트
python${PYTHON_VERSION} -m pip install --upgrade pip

# 필요 패키지 설치
pip install -r requirements.txt