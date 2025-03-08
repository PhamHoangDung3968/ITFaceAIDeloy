# Sử dụng hình ảnh Python chính thức từ Docker Hub
FROM python:3.11-slim

# Cài đặt các gói cần thiết để xây dựng dlib
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libopenblas-dev \
    liblapack-dev \
    libx11-dev \
    libgtk-3-dev \
    && rm -rf /var/lib/apt/lists/*

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép file requirements.txt vào thư mục làm việc
COPY requirements.txt .

# Cài đặt các gói phụ thuộc
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép toàn bộ mã nguồn vào thư mục làm việc
COPY . .

# Mở cổng 5000 để ứng dụng có thể truy cập từ bên ngoài
EXPOSE 5000

# Chạy ứng dụng
CMD ["python", "main.py"]