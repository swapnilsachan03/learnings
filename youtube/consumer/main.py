import json
import boto3

from secret_keys import SecretKeys

secret_keys = SecretKeys()
sqs_client = boto3.client("sqs", region_name=secret_keys.REGION_NAME)

ecs_client = boto3.client("ecs", region_name=secret_keys.REGION_NAME)


def poll_sqs():
    while True:
        response = sqs_client.receive_message(
            QueueUrl=secret_keys.AWS_SQS_RAW_VIDEO_PROCESSING,
            MaxNumberOfMessages=1,
            WaitTimeSeconds=10,
        )

        for message in response.get("Messages", []):
            message_body = json.loads(message.get("Body"))

            if (
                "Service" in message_body
                and "Event" in message_body
                and message_body.get("Event") == "s3:TestEvent"
            ):
                sqs_client.delete_message(
                    QueueUrl=secret_keys.AWS_SQS_RAW_VIDEO_PROCESSING,
                    ReceiptHandle=message["ReceiptHandle"],
                )
                continue

            if "Records" in message_body:
                s3_record = message_body["Records"][0]["s3"]
                bucket_name = s3_record["bucket"]["name"]
                s3_key = s3_record["object"]["key"]

                response = ecs_client.run_task(
                    cluster="arn:aws:ecs:ap-south-1:802084756196:cluster/learnings-youtube-transcoder-cluster",
                    launchType="FARGATE",
                    taskDefinition="arn:aws:ecs:ap-south-1:802084756196:task-definition/learnings-video-transcoder:2",
                    overrides={
                        "containerOverrides": [
                            {
                                "name": "learnings-video-transcoder",
                                "environment": [
                                    {"name": "S3_BUCKET", "value": bucket_name},
                                    {"name": "S3_KEY", "value": s3_key},
                                ],
                            }
                        ],
                    },
                    networkConfiguration={
                        "awsvpcConfiguration": {
                            "subnets": [
                                "subnet-085bdd23cdcc087bf",
                                "subnet-0de394d6ca12b3422",
                                "subnet-0c282616bed6342a4",
                            ],
                            "assignPublicIp": "ENABLED",
                            "securityGroups": ["sg-07bef0d162ac76b24"],
                        }
                    },
                )

                print(response)
                sqs_client.delete_message(
                    QueueUrl=secret_keys.AWS_SQS_RAW_VIDEO_PROCESSING,
                    ReceiptHandle=message["ReceiptHandle"],
                )


poll_sqs()
