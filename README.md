# TypeScript Backen Project Setup Script

A bash script that scaffolds a TypeScript + Node.js backend project with a sensible config in one command.

## What it sets up

- `pnpm` project with `typescript`, `tsx`, and `@types/node`
- Strict `tsconfig.json` (NodeNext modules, `noUncheckedIndexedAccess`, `exactOptionalPropertyTypes`, etc.)
- `src/index.ts` entry point with a hello world
- `dev`, `build`, and `start` scripts
- `.gitignore` with common exclusions

## Usage

```bash
chmod +x project_init.sh
./project_init.sh
```

You'll be prompted for a project name, then a ready-to-use project folder is created.

```bash
cd <your-project-name>
pnpm dev
```

## Requirements

- bash
- pnpm
