from flask import Flask
from redis import Redis
import os
app = Flask(__name__)
redis = Redis(host="redis_1", port=6379)

@app.route('/')
def hello():
    # Every GET request thrown to this instance will increase the 'hits' key in redis...
    redis.incr('hits')
    # ...and render the amount of hits
    return 'Hello World! I have been seen %s times.' % redis.get('hits')

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
