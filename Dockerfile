FROM python:3.11-slim

# Rust와 Cargo 설치
RUN apt-get update && \
    apt-get install -y curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    export PATH="$HOME/.cargo/bin:$PATH"

# 작업 디렉토리 설정
WORKDIR /app

# 필요 패키지 설치
COPY requirements.txt ./
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# 애플리케이션 파일 복사
COPY . .

# Streamlit 애플리케이션 실행
CMD ["streamlit", "run", "your_app.py"]
