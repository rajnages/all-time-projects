# Import statements are correct
import json
import boto3

def lambda_handler(event,context):
    # Error: json.dump() should be json.dumps() for string serialization
    # Error: Response format should use 'statusCode' as one word, not 'status code'
    print(event)
    return{
        'statusCode': 200,
        'body': json.dumps("Hello world lambda") 
    }

# Test invocation is ok but not needed in production Lambda code
lambda_handler(None, None)
