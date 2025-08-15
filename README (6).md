## 📌 Title and Description

**AutoS3Uploader**

A lightweight Bash script that automates the process of uploading files from an EC2 instance to an AWS S3 bucket.
It allows users to either create a new bucket or use an existing one, checks AWS CLI installation and configuration, and securely uploads files or folders to the specified bucket.

## 🚀 Features

- Automatically checks and installs AWS CLI v2 if missing.

- Verifies AWS CLI configuration before proceeding.

- Lets you create a new S3 bucket or use an existing bucket.

- Uploads files or folders directly from the EC2 instance to S3.

- Provides clear prompts and error handling for smooth execution.



## 💻 Tech Stack

- Bash/Shell Scripting
- AWS CLI v2

## 🌐 AWS Services Used

- **Amazon S3** – For storing uploaded files.

- **AWS IAM** – For managing permissions to access and upload to S3.


## 🛠️ Installation

1. Clone this repository on your EC2 instance:
   ```bash
   git clone https://github.com/<your-username>/AutoS3Uploader.git
   cd AutoS3Uploader

2. Give execution permission:
   ```bash
    chmod +x AutoS3Uploader.sh

3. Ensure AWS CLI is configured:
   ```bash
   aws configure

    
## 📦 Usage

1. Run the script using the command:
   ```bash
   ./AutoS3Uploader.sh

You will be prompted to:

- Choose whether to create a new S3 bucket or use an existing one.

- Enter the bucket name (and region if creating a new one).

- Provide the full path of the file or folder on the EC2 instance.

- The script uploads your file/folder to S3.
## 📚 Lessons Learned

- How to automate AWS CLI operations using Bash.

- Handling user input and conditions in shell scripts.

- Managing AWS S3 buckets and file uploads programmatically.

- Implementing error handling with set -euo pipefail for safer scripts.
## 👩‍💻 Author
**Nishika Jaiswal**  
Aspiring Cloud & DevOps Engineer
