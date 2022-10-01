# Django starter template for Fly.io

```bash
# Set up the poetry environment
$ poetry init
$ poetry add django dj-database-url daphne psycopg2-binary
# Start a django project with this template.
$ poetry run django-admin startproject --template <> --extension=py,toml --name=Dockerfile <ProjectName> .

# Launch a new Fly app.
$ flyctl launch
# Configure a Postgres database in your Fly.io account.
$ flyctl postgres create
# Make a note of the db app name you choose.
$ flyctl postgres attach <db-name>
# db-name should be what you selected in the previous step.
$ flyctl secrets set DJANGO_SECRET_KEY=<generated secret key>
# deploy!
$ flyctl deploy --local-only
```
