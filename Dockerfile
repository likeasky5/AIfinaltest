FROM python:3.11-slim

# Rust와 Cargo 설치
RUN apt-get update && \
    apt-get install -y curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    export PATH="$HOME/.cargo/bin:$PATH"

# 필요한 패키지 설치
COPY requirements.txt .
RUN pip install -r requirements.txt

# Streamlit 앱 복사
COPY . /app
WORKDIR /app

# 앱 실행
CMD ["streamlit", "run", "your_app.py"]
