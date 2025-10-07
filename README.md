# README

## Development

To set up the development environment, follow these steps:

1. Clone the repository:
   ```bash
   git clone
   ```
2. Start the local database container:
   ```bash
   cd ./infrastructure/erster-advent
   docker-compose up -d
   ```

## Live server

To do live development, you need to do those 3 steps:

```bash
# Rails dev server
bin/dev

# Tailwind CSS watcher
bin/rails tailwindcss:watch

# Guard for live reload
bundle exec guard -d
```

## Tools

To find formatting issues, run:

```bash
erb-format {path to file}
```

**credentials**
email: superadmin@example.com
pw: superadmin@example.com

## Dev Database

credentials for local dev database:

- host: localhost
- port: 5432

- database: dev_db
- user: postgres
- password: postgres
