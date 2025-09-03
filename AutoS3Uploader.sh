#!/bin/bash

set -euo pipefail

check_awscli() {
    if ! command -v aws &> /dev/null; then
       echo "AWS CLI is not installed. Please install it first." >&2
       return 1
    fi
}

install_awscli() {
    echo "Installing AWS CLI v2 on Linux..."

    # Download and install AWS CLI v2
    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    sudo apt-get install -y unzip &> /dev/null
    unzip -q awscliv2.zip
    sudo ./aws/install

    # Verify installation
    aws --version

    # Clean up
    rm -rf awscliv2.zip ./aws
}

check_aws_config() {
    if ! aws sts get-caller-identity &> /dev/null; then
        echo "AWS CLI is not configured."
        echo "Run 'aws configure' to set your AWS keys, region, and output format."
        exit 1
    fi
}

main() {
    # Step 1: Check and install AWS CLI
    if ! check_awscli; then
        install_awscli || exit 1
    fi

    # Step 2: Check AWS CLI configuration
    check_aws_config

    # Step 3: Ask user to choose bucket option
    echo "Bucket options:"
    echo "1. Create new bucket"
    echo "2. Use existing bucket"
    read -p "Enter choice (1 or 2): " bucket_choice

    if [ "$bucket_choice" -eq 1 ]; then

        read -p "Enter new bucket name: " bucket_name
        read -p "Enter AWS region (e.g., ap-south-1): " region
        aws s3 mb s3://"$bucket_name" --region "$region"
        echo " Bucket created: $bucket_name"
        echo "Proceeding to file upload..."

    elif [ "$bucket_choice" -eq 2 ]; then
        echo " Listing your existing buckets..."
        aws s3 ls
        read -p "Enter the bucket name from the above list: " bucket_name

    else
        echo "Invalid choice."
        exit 1
    fi

    # Step 4: Upload from EC2
    read -p "Enter the full path of the file or folder on this EC2 instance: " file_path
if [ -d "$file_path" ]; then
    aws s3 cp "$file_path" s3://"$bucket_name" --recursive
else
    aws s3 cp "$file_path" s3://"$bucket_name"
fi
echo " Files uploaded successfully!"
}


main "$@"

