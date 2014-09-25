# Edit this file to override the default graphite settings, do not edit settings.py

SECRET_KEY = 'UNSAFE_DEFAULT'

# Turn on debugging and restart apache if you ever see an "Internal Server Error" page
DEBUG = True

# Set your local timezone (django will try to figure this out automatically)
TIME_ZONE = 'UTC'

GRAPHITE_ROOT = '/var/lib/graphite'
CONF_DIR = '/var/lib/graphite/conf'
STORAGE_DIR = '/var/lib/graphite/storage'
CONTENT_DIR = '/var/lib/graphite/webapp/content'
DASHBOARD_CONF = '/var/lib/graphite/conf/dashboard.conf'
GRAPHTEMPLATES_CONF = '/var/lib/graphite/conf/graphTemplates.conf'

WHISPER_DIR = '/var/lib/graphite/storage/whisper'
RRD_DIR = '/var/lib/graphite/storage/rrd'
DATA_DIRS = [WHISPER_DIR, RRD_DIR] # Default: set from the above variables
LOG_DIR = '/var/lib/graphite/storage/log/webapp'
INDEX_FILE = '/var/lib/graphite/storage/index'  # Search index file


# If sqlite won't cut it, configure your real database here (don't forget to run manage.py syncdb!)
DATABASES = {
    'default': {
        'NAME': 'graphite',
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'USER': 'graphite',
        'PASSWORD': 'graphite',
        'HOST': 'localhost',
        'PORT': '5432'
    }
}
