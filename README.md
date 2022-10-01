# Django starter template for Fly.io

This template contains a starter Django project, Dockerfile and fly.toml config for hosting a [Django](https://www.djangoproject.com) app on [Fly.io](https://fly.io).

The repository is set up as a [custom Django project template](https://docs.djangoproject.com/en/4.1/ref/django-admin/#startproject).

All you'll need installed to get started is [Poetry](https://python-poetry.org) and [Docker](https://www.docker.com) for local builds.

To get all the way from starting an app to deployment, follow these instructions:

```bash
# Set up the poetry environment
$ poetry init
$ poetry add django dj-database-url daphne psycopg2-binary
# Start a django project with this template.
$ poetry run django-admin startproject --template https://github.com/davish/django-flyio-template/archive/refs/heads/main.zip --extension=py,toml --name=Dockerfile <ProjectName> .

# Launch a new Fly app.
$ flyctl launch --copy-config --no-deploy
$ ./set_hostname.sh
# If you haven't already, configure a Postgres database in your Fly.io account.
$ flyctl postgres create
# Make a note of the db app name you choose.
$ flyctl postgres attach <db-name>
# db-name should be what you selected in the previous step.
$ flyctl secrets set DJANGO_SECRET_KEY=<generated secret key>
```

At this point, everything is set up and ready to go. You can [add a custom user model](https://docs.djangoproject.com/en/3.2/topics/auth/customizing/#using-a-custom-user-model-when-starting-a-project) or make any other modifications at this point so that those changes are reflected in the first database migration and deploy.

Once you're ready for deploy:

```bash
flyctl deploy --local-only
```
