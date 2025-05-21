# initialize Redis connection settings
REDIS_HOST = "redis-15105.c16.us-east-1-2.ec2.redns.redis-cloud.com"
REDIS_PORT = 15105
REDIS_PASSWORD = "q0pD82dV4T2a643Zw8tnba0RR4rAEV3P"
REDIS_DB = 0

# initialize constants used to control image spatial dimensions and
# data type
IMAGE_WIDTH = 224
IMAGE_HEIGHT = 224
IMAGE_CHANS = 3
IMAGE_DTYPE = "float32"

# initialize constants used for server queuing
IMAGE_QUEUE = "image_queue"
BATCH_SIZE = 32
SERVER_SLEEP = 0.25
CLIENT_SLEEP = 0.25
