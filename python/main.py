import json
import boto3

def lambda_handler(event,context):
    return{
        'status code': 200,
        'body': json.dump("Hello world lambda")
    }