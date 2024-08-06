<<<<<<< HEAD
# Mia Share Project

This project contains dbt models for analyzing program and student data on the Mia Share platform.

## Models Included

- `question_one.sql`: Analysis of active schools and their programs.
- `question_two.sql`: Analysis of program groups and student associations.
- `question_three.sql`: Revenue by AE
- `question_four.sql`: Summary of accounts by status
- `question_five.sql`: Annual Revenue Capture %

## Setup Instructions

### Install dbt

Follow the instructions at [dbt documentation](https://docs.getdbt.com/docs/get-started/getting-started-dbt-core) to install dbt.

### Configure Profiles

Create a `profiles.yml` file in your `~/.dbt` directory with the following content:

```yaml
mia_share:
  target: dev
  outputs:
    dev:
      type: mysql
      host: fake-data.mia-share.com
      user: dataassessmentuser
      password: REDACTED--Contact Administrator
      database: forge
      schema: forge
      port: 3306
